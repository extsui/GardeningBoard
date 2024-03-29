/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2020 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include <stdio.h>
#include <string.h>
#include "Libraries/Balan.hpp"
#include "Libraries/Console.hpp"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
I2C_HandleTypeDef hi2c1;

UART_HandleTypeDef huart2;
DMA_HandleTypeDef hdma_usart2_rx;

/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_DMA_Init(void);
static void MX_I2C1_Init(void);
static void MX_USART2_UART_Init(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */
extern "C" int _write(int file, char *ptr, int len)
{
	for(int i = 0; i < len; i++)
	{
		ITM_SendChar(*ptr++);
	}
	return len;
}

/**
 * 現在のヒープの先頭を取得する
 *
 * @attension
 * 次に確保したときのアドレスを返すので、
 * 厳密にはヒープの先頭ではないことに注意。
 */
uint32_t QueryCurrentHeapTop()
{
	int *p = new int(0);
	delete p;
	return reinterpret_cast<uint32_t>(p);
}

/**
 * ヒープの末尾 (アドレス下位側) から指定サイズ分だけデバッグ用の値で埋める
 */
extern "C" void FillHeapForDebug(uint32_t bottom, uint32_t size, uint8_t fill)
{
	/*
	 *  +-----+ <-- 0x0000000
	 *  |     |
	 * ~~~~~~~~~
	 * ~~~~~~~~~
	 *  |     |
	 *  +-----+ <-- """about""" 0x20000388 (heap bottom)
	 *  |#####| <-- used
	 *  |  H  |
	 *  |  E  |
	 *  + - - + <-- margin
	 *  |//A//|
	 *  |//P//| <-- (fill)
	 *  |/////|
	 *  +-----+ <-- heap top (= bottom + size)
	 *  |     |
	 */
	uint32_t top = bottom + size;
	uint32_t margin = size / 2;
	memset(reinterpret_cast<void*>(top - margin), fill, margin);

	DEBUG_LOG("heap  : 0x%08lx-0x%08lx (%4lu) [fill=0x%02X, margin=%lu]\n",
		bottom, top, size, fill, margin);
}

/**
 * スタックの末尾 (アドレス上位側) から指定サイズ分だけデバッグ用の値で埋める
 */
extern "C" void FillStackForDebug(uint32_t bottom, uint32_t size, uint8_t fill)
{
	/*
	 *  +-----+ <-- 0x0000000
	 *  |     |
	 * ~~~~~~~~~
	 * ~~~~~~~~~
	 *  |     |
	 *  +-----+ <-- stack top (= bottom - size)
	 *  |/////|
	 *  |//S//| <-- (fill)
	 *  |//T//|
	 *  + -A- + <-- margin
	 *  |  C  |
	 *  |  K  |
	 *  |#####| <-- used ($sp)
	 *  +-----+ <-- 0x20003000 (stack bottom)
	 *  |     |
	 */
	uint32_t top = bottom - size;
	uint32_t margin = size / 2;
	memset(reinterpret_cast<void*>(top - margin), fill, margin);

	DEBUG_LOG("stack : 0x%08lx-0x%08lx (%4lu) [fill=0x%02X, margin=%lu]\n",
		top, bottom, size, fill, margin);
}

extern "C" void ConfigMemory()
{

	// *.map の設定シンボル
	extern char Min_Heap_Size asm("_Min_Heap_Size");
	extern char Min_Stack_Size asm("_Min_Stack_Size");
	// *.map のメモリ関連シンボル
	extern char stext asm("g_pfnVectors");	// text 開始アドレス (割り込みベクタテーブル)
	extern char sidata asm("_sidata");
	extern char etext asm("_etext");		// text 終了アドレス
	extern char sdata asm("_sdata");		// data 開始アドレス
	extern char edata asm("_edata");		// data 終了アドレス
	extern char sbss asm("_sbss");			// bss 開始アドレス
	extern char ebss asm("_ebss");			// bss 終了アドレス
	extern char end asm("end");			// data, bss の末尾 (heap 先頭)
	extern char estack asm("_estack");		// user_heap_stack の末尾 (stack 末尾)

	DEBUG_LOG("== Memory Configuration ==\n");
	DEBUG_LOG("-- Settings\n");
	DEBUG_LOG("Min_Heap_Size  : %p\n", &Min_Heap_Size);
	DEBUG_LOG("Min_Stack_Size : %p\n", &Min_Stack_Size);
	DEBUG_LOG("-- Symbols\n");
	DEBUG_LOG("stext  : %p\n", &stext);
	DEBUG_LOG("sidata : %p\n", &sidata);
	DEBUG_LOG("etext  : %p\n", &etext);
	DEBUG_LOG("sdata  : %p\n", &sdata);
	DEBUG_LOG("edata  : %p\n", &edata);
	DEBUG_LOG("sbss   : %p\n", &sbss);
	DEBUG_LOG("ebss   : %p\n", &ebss);
	DEBUG_LOG("end    : %p\n", &end);
	DEBUG_LOG("estack : %p\n", &estack);
	DEBUG_LOG("-- Areas\n");
	FillHeapForDebug(reinterpret_cast<uint32_t>(&end), reinterpret_cast<uint32_t>(&Min_Heap_Size), 0xEE);
	FillStackForDebug(reinterpret_cast<uint32_t>(&estack), reinterpret_cast<uint32_t>(&Min_Stack_Size), 0xCC);
	DEBUG_LOG("\n");
}

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */
  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_DMA_Init();
  MX_I2C1_Init();
  MX_USART2_UART_Init();
  /* USER CODE BEGIN 2 */
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  ConfigMemory();
  DEBUG_LOG("Hello World!\n");
  Console *console = new Console(&huart2);
  console->Run();
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
  RCC_PeriphCLKInitTypeDef PeriphClkInit = {0};

  /** Initializes the CPU, AHB and APB busses clocks 
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.HSEPredivValue = RCC_HSE_PREDIV_DIV1;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL2;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }
  /** Initializes the CPU, AHB and APB busses clocks 
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_0) != HAL_OK)
  {
    Error_Handler();
  }
  PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_I2C1;
  PeriphClkInit.I2c1ClockSelection = RCC_I2C1CLKSOURCE_SYSCLK;
  if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief I2C1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_I2C1_Init(void)
{

  /* USER CODE BEGIN I2C1_Init 0 */

  /* USER CODE END I2C1_Init 0 */

  /* USER CODE BEGIN I2C1_Init 1 */

  /* USER CODE END I2C1_Init 1 */
  hi2c1.Instance = I2C1;
  hi2c1.Init.Timing = 0x00303D5B;
  hi2c1.Init.OwnAddress1 = 0;
  hi2c1.Init.AddressingMode = I2C_ADDRESSINGMODE_7BIT;
  hi2c1.Init.DualAddressMode = I2C_DUALADDRESS_DISABLE;
  hi2c1.Init.OwnAddress2 = 0;
  hi2c1.Init.OwnAddress2Masks = I2C_OA2_NOMASK;
  hi2c1.Init.GeneralCallMode = I2C_GENERALCALL_DISABLE;
  hi2c1.Init.NoStretchMode = I2C_NOSTRETCH_ENABLE;
  if (HAL_I2C_Init(&hi2c1) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure Analogue filter 
  */
  if (HAL_I2CEx_ConfigAnalogFilter(&hi2c1, I2C_ANALOGFILTER_ENABLE) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure Digital filter 
  */
  if (HAL_I2CEx_ConfigDigitalFilter(&hi2c1, 0) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN I2C1_Init 2 */

  /* USER CODE END I2C1_Init 2 */

}

/**
  * @brief USART2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART2_UART_Init(void)
{

  /* USER CODE BEGIN USART2_Init 0 */

  /* USER CODE END USART2_Init 0 */

  /* USER CODE BEGIN USART2_Init 1 */

  /* USER CODE END USART2_Init 1 */
  huart2.Instance = USART2;
  huart2.Init.BaudRate = 115200;
  huart2.Init.WordLength = UART_WORDLENGTH_8B;
  huart2.Init.StopBits = UART_STOPBITS_1;
  huart2.Init.Parity = UART_PARITY_NONE;
  huart2.Init.Mode = UART_MODE_TX_RX;
  huart2.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart2.Init.OverSampling = UART_OVERSAMPLING_16;
  huart2.Init.OneBitSampling = UART_ONE_BIT_SAMPLE_DISABLE;
  huart2.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;
  if (HAL_UART_Init(&huart2) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN USART2_Init 2 */

  /* USER CODE END USART2_Init 2 */

}

/** 
  * Enable DMA controller clock
  */
static void MX_DMA_Init(void) 
{

  /* DMA controller clock enable */
  __HAL_RCC_DMA1_CLK_ENABLE();

  /* DMA interrupt init */
  /* DMA1_Channel6_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA1_Channel6_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA1_Channel6_IRQn);

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOF_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOA, I2C_LOWER_SCL_Pin|I2C_LOWER_SDA_Pin, GPIO_PIN_SET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(DEBUG_LED_GPIO_Port, DEBUG_LED_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pins : I2C_SLAVE_ADDR_A0_Pin I2C_SLAVE_ADDR_A1_Pin I2C_SLAVE_ADDR_A2_Pin */
  GPIO_InitStruct.Pin = I2C_SLAVE_ADDR_A0_Pin|I2C_SLAVE_ADDR_A1_Pin|I2C_SLAVE_ADDR_A2_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull = GPIO_PULLUP;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /*Configure GPIO pins : I2C_LOWER_SCL_Pin I2C_LOWER_SDA_Pin */
  GPIO_InitStruct.Pin = I2C_LOWER_SCL_Pin|I2C_LOWER_SDA_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_OD;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /*Configure GPIO pin : DEBUG_LED_Pin */
  GPIO_InitStruct.Pin = DEBUG_LED_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
  HAL_GPIO_Init(DEBUG_LED_GPIO_Port, &GPIO_InitStruct);

}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */

  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{ 
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     tex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
