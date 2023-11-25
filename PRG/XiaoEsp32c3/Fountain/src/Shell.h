#ifndef SHELL_H
#define SHELL_H

/**
 * @brief 入力文字を解析して行単位でコマンド解釈および実行する
 * 
 * @param ch 入力文字
 */
void ParseAndExecuteCommand(uint8_t ch) noexcept;

#endif /* SHELL_H */
