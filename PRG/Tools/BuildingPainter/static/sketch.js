// WebSocketサーバーへの接続を確立
const g_Socket = io.connect('http://127.0.0.1:5000');  // サーバーのURLに適宜変更

// 7セグ全体描画の原点
const OriginX = 10;
const OriginY = 10;

// 7セグの桁数
const DigitXCount = 6;
const DigitYCount = 6;

// 7セグデータテーブル
let g_7SegTable = [];

// 直前の 16 進数 1 行データ
let g_PreviousHexOneline = '';

// a, g, d セグ (横方向セグメント)
const HorizontalSegmentHeightBase = 10 + 5;
const HorizontalSegmentWidthBase = 40 + 5;
// b, c, e, f セグ (縦方向セグメント)
const VerticalSegmentHeightBase = 40 + 5;
const VerticalSegmentWidthBase = 10 + 5;
// セグメント間の隙間
const SegmentGapBase = 10;
// セグメント原点 (f セグの x 座標, a セグの y 座標)
const SegmentOriginXBase = 10;
const SegmentOriginYBase = 10;

// スライダー要素を格納する変数
let slider1;
let slider2;

const ButtonType = {
    Clear: 0,
    Fill: 1,
    Toggle: 2,
    Import: 3,
};

let g_ButtonEvent = null;

function assert(condition, message) {
    if (!condition) {
        console.error('Assertion failed: ', message);
    }
}

// 7セグテーブル初期化
function init7SegTable() {
    for (let y = 0; y < DigitYCount; y++) {
        g_7SegTable[y] = [];
        for (let x = 0; x < DigitXCount; x++) {
            g_7SegTable[y][x] = 0x00;
        }
    }
}

function clear7SegTable() {
    for (let y = 0; y < DigitYCount; y++) {
        for (let x = 0; x < DigitXCount; x++) {
            g_7SegTable[y][x] = 0x00;
        }
    }
}

function fill7SegTable() {
    for (let y = 0; y < DigitYCount; y++) {
        for (let x = 0; x < DigitXCount; x++) {
            g_7SegTable[y][x] = 0xFF;
        }
    }
}

function toggle7SegTable() {
    for (let y = 0; y < DigitYCount; y++) {
        for (let x = 0; x < DigitXCount; x++) {
            g_7SegTable[y][x] ^= 0xFF;
        }
    }
}

// 7 セグテーブルからプログラム形式 (C 配列) に変換
function convertToProgramFormat(_7SegTable) {
    let programText = '';
    for (let y = 0; y < DigitYCount; y++) {
        for (let x = 0; x < DigitXCount; x++) {
            programText += '0x' + _7SegTable[y][x].toString(16).padStart(2, '0').toUpperCase() + ', ';
        }
        programText += '\n';
    }
    return programText;
}

// 7 セグテーブルから 1 行の 16 進数文字列に変換
function convertToHexOneline(_7SegTable) {
    let onelineText = '';
    for (let y = 0; y < DigitYCount; y++) {
        for (let x = 0; x < DigitXCount; x++) {
            onelineText += _7SegTable[y][x].toString(16).padStart(2, '0').toUpperCase();
        }
    }
    return onelineText;
}

// 7 セグテーブルを元に HTML の 16 進数文字列を更新
function updateHtmlHexString(_7SegTable) {
    let programText = convertToProgramFormat(_7SegTable);
    textAreaHexDumpProgram = select('#textAreaHexDumpProgram');
    textAreaHexDumpProgram.value(programText);

    let onelineText = convertToHexOneline(_7SegTable)
    textAreaHexDumpOneline = select('#textAreaHexDumpOneline');
    textAreaHexDumpOneline.value(onelineText);
}

// 7セグメントLEDのセグメントを描画する関数
function drawSegment(x, y, w, h, on) {
    stroke(0);
    strokeWeight(0);
    fill(on ? color(255, 0, 0) : color(50)); // 赤色で塗りつぶす
    rect(x, y, w, h);
}

// パターンを表示する関数
function displayPattern(x, y, scale, pattern) {
    let horizontalSegmentHeight = HorizontalSegmentHeightBase * scale;
    let horizontalSegmentWidth = HorizontalSegmentWidthBase * scale;
    let verticalSegmentHeight = VerticalSegmentHeightBase * scale;
    let verticalSegmentWidth = VerticalSegmentWidthBase * scale;
    let segmentGap = SegmentGapBase * scale;
    let segmentOriginX = SegmentOriginXBase * scale;
    let segmentOriginY = SegmentOriginYBase * scale;

    // a, b, c, d, e, f, g, * が pattern の bit[7:0] に対応
    // a
    drawSegment(
        x + segmentOriginX + verticalSegmentWidth + segmentGap,
        y + segmentOriginY,
        horizontalSegmentWidth,
        horizontalSegmentHeight,
        pattern & (1<<7));
    // b
    drawSegment(
        x + segmentOriginX + (verticalSegmentWidth + segmentGap) + horizontalSegmentWidth + segmentGap,
        y + segmentOriginY + (horizontalSegmentHeight + segmentGap),
        verticalSegmentWidth,
        verticalSegmentHeight,
        pattern & (1<<6));
    // c
    drawSegment(
        x + segmentOriginX + (verticalSegmentWidth + segmentGap) + horizontalSegmentWidth + segmentGap,
        y + segmentOriginY + (horizontalSegmentHeight + segmentGap) + verticalSegmentHeight + (horizontalSegmentHeight + segmentGap * 2),
        verticalSegmentWidth,
        verticalSegmentHeight,
        pattern & (1<<5));
    // d
    drawSegment(
        x + segmentOriginX + verticalSegmentWidth + segmentGap,
        y + segmentOriginY + (horizontalSegmentHeight + segmentGap) + (verticalSegmentHeight + segmentGap) + (horizontalSegmentHeight + segmentGap + verticalSegmentHeight + segmentGap),
        horizontalSegmentWidth,
        horizontalSegmentHeight,
        pattern & (1<<4));
    // e
    drawSegment(
        x + segmentOriginX,
        y + segmentOriginY + (horizontalSegmentHeight + segmentGap) + verticalSegmentHeight + (horizontalSegmentHeight + segmentGap * 2),
        verticalSegmentWidth,
        verticalSegmentHeight,
        pattern & (1<<3));
    // f
    drawSegment(
        x + segmentOriginX,
        y + segmentOriginY + (horizontalSegmentHeight + segmentGap),
        verticalSegmentWidth,
        verticalSegmentHeight,
        pattern & (1<<2));
    // g
    drawSegment(
        x + segmentOriginX + verticalSegmentWidth + segmentGap,
        y + segmentOriginY + (horizontalSegmentHeight + segmentGap) + (verticalSegmentHeight + segmentGap),
        horizontalSegmentWidth,
        horizontalSegmentHeight,
        pattern & (1<<1));
    // dot
    drawSegment(
        x + segmentOriginX + (verticalSegmentWidth + segmentGap) + (horizontalSegmentWidth + segmentGap) + verticalSegmentWidth,
        y + segmentOriginY + (horizontalSegmentHeight + segmentGap) + (verticalSegmentHeight + segmentGap) + (horizontalSegmentHeight + segmentGap + verticalSegmentHeight + segmentGap),
        horizontalSegmentHeight,
        verticalSegmentWidth,
        pattern & (1<<0));
}

// 数字から7セグパターンに変換
function convertToSegmentPattern(number, dot = false) {
    assert(0 <= number && number <= 9, 'convertToSegmentPattern()');
    const NumberSegmentPattern = [
        0b1111_1100,    // 0
        0b0110_0000,    // 1
        0b1101_1010,    // 2
        0b1111_0010,    // 3
        0b0110_0110,    // 4
        0b1011_0110,    // 5
        0b1011_1110,    // 6
        0b1110_0100,    // 7
        0b1111_1110,    // 8
        0b1111_0110,    // 9
    ];
    reference = NumberSegmentPattern[number];
    pattern = 0x00;
    pattern |= (reference & (1<<7)) ? (1<<7) : 0; // a
    pattern |= (reference & (1<<6)) ? (1<<6) : 0; // b
    pattern |= (reference & (1<<5)) ? (1<<5) : 0; // c
    pattern |= (reference & (1<<4)) ? (1<<4) : 0; // d
    pattern |= (reference & (1<<3)) ? (1<<3) : 0; // e
    pattern |= (reference & (1<<2)) ? (1<<2) : 0; // f
    pattern |= (reference & (1<<1)) ? (1<<1) : 0; // g
    pattern |= (dot) ? (1<<0) : 0; // dot
    return pattern;
}

// 数字を表示する関数
function displayNumber(x, y, scale, number) {
    displayPattern(x, y, scale, convertToSegmentPattern(number));
}

// 描画された 7 セグメント LED 内で各セグメントに当たっているかの判定
// @param [in] drawX 描画時のX座標
// @param [in] drawY 描画時のY座標
// @param [in] drawScale 描画時のスケール
// @param [in] clickedX クリックされたX座標
// @param [in] clickedY クリックされたY座標
// @return クリックされていたセグメントパターン (未クリックなら 0x00)
function detectSegmentCollisions(drawX, drawY, drawScale, clickedX, clickedY) {
    let horizontalSegmentHeight = HorizontalSegmentHeightBase * drawScale;
    let horizontalSegmentWidth = HorizontalSegmentWidthBase * drawScale;
    let verticalSegmentHeight = VerticalSegmentHeightBase * drawScale;
    let verticalSegmentWidth = VerticalSegmentWidthBase * drawScale;
    let segmentGap = SegmentGapBase * drawScale;
    let segmentOriginX = SegmentOriginXBase * drawScale;
    let segmentOriginY = SegmentOriginYBase * drawScale;

    function isInsideRectangle(rectX, rectY, rectWidth, rectHeight, targetX, targetY) {
        return (targetX >= rectX) && (targetX <= rectX + rectWidth) &&
               (targetY >= rectY) && (targetY <= rectY + rectHeight);
    }
    
    detectPattern = 0x00;
    
    // TODO: 描画ロジックとの共通化    
    // a
    detectPattern |= isInsideRectangle(
        drawX + segmentOriginX + verticalSegmentWidth + segmentGap,
        drawY + segmentOriginY,
        horizontalSegmentWidth,
        horizontalSegmentHeight,
        clickedX, clickedY)
        ? (1<<7) : 0;
    // b
    detectPattern |= isInsideRectangle(
        drawX + segmentOriginX + (verticalSegmentWidth + segmentGap) + horizontalSegmentWidth + segmentGap,
        drawY + segmentOriginY + (horizontalSegmentHeight + segmentGap),
        verticalSegmentWidth,
        verticalSegmentHeight,
        clickedX, clickedY)
        ? (1<<6) : 0;
    // c
    detectPattern |= isInsideRectangle(
        drawX + segmentOriginX + (verticalSegmentWidth + segmentGap) + horizontalSegmentWidth + segmentGap,
        drawY + segmentOriginY + (horizontalSegmentHeight + segmentGap) + verticalSegmentHeight + (horizontalSegmentHeight + segmentGap * 2),
        verticalSegmentWidth,
        verticalSegmentHeight,
        clickedX, clickedY)
        ? (1<<5) : 0;
    // d
    detectPattern |= isInsideRectangle(
        drawX + segmentOriginX + verticalSegmentWidth + segmentGap,
        drawY + segmentOriginY + (horizontalSegmentHeight + segmentGap) + (verticalSegmentHeight + segmentGap) + (horizontalSegmentHeight + segmentGap + verticalSegmentHeight + segmentGap),
        horizontalSegmentWidth,
        horizontalSegmentHeight,
        clickedX, clickedY)
        ? (1<<4) : 0;
    // e
    detectPattern |= isInsideRectangle(
        drawX + segmentOriginX,
        drawY + segmentOriginY + (horizontalSegmentHeight + segmentGap) + verticalSegmentHeight + (horizontalSegmentHeight + segmentGap * 2),
        verticalSegmentWidth,
        verticalSegmentHeight,
        clickedX, clickedY)
        ? (1<<3) : 0;
    // f
    detectPattern |= isInsideRectangle(
        drawX + segmentOriginX,
        drawY + segmentOriginY + (horizontalSegmentHeight + segmentGap),
        verticalSegmentWidth,
        verticalSegmentHeight,
        clickedX, clickedY)
        ? (1<<2) : 0;
    // g
    detectPattern |= isInsideRectangle(
        drawX + segmentOriginX + verticalSegmentWidth + segmentGap,
        drawY + segmentOriginY + (horizontalSegmentHeight + segmentGap) + (verticalSegmentHeight + segmentGap),
        horizontalSegmentWidth,
        horizontalSegmentHeight,
        clickedX, clickedY)
        ? (1<<1) : 0;
    // dot
    detectPattern |= isInsideRectangle(
        drawX + segmentOriginX + (verticalSegmentWidth + segmentGap) + (horizontalSegmentWidth + segmentGap) + verticalSegmentWidth,
        drawY + segmentOriginY + (horizontalSegmentHeight + segmentGap) + (verticalSegmentHeight + segmentGap) + (horizontalSegmentHeight + segmentGap + verticalSegmentHeight + segmentGap),
        horizontalSegmentHeight,
        verticalSegmentWidth,
        clickedX, clickedY)
        ? (1<<0) : 0;
    return detectPattern;
}

function setup() {
    init7SegTable();

    let canvas = createCanvas(600, 800);
    canvas.parent('canvas');    // canvas 表示位置を html 内と連動させる

    background(0);

    slider1 = select('#slider1');
    slider1.input(updateValue);

    slider2 = select('#slider2');
    slider2.input(updateValue);

    // ボタンの要素を取得
    buttonClear = select('#buttonClear');
    buttonFill = select('#buttonFill');
    buttonToggle = select('#buttonToggle');
    buttonImport = select('#buttonImport');
    
    // ボタンがクリックされたときに関数を呼び出す
    buttonClear.mousePressed(onButtonClearClicked);
    buttonFill.mousePressed(onButtonFillClicked);
    buttonToggle.mousePressed(onButtonToggleClicked);
    buttonImport.mousePressed(onButtonImportClicked);
}

function debugLog(x, y, str) {
    fill(255); // 白色のテキスト
    strokeWeight(0);
    textSize(9); // フォントサイズ
    text(str, x, y); // メッセージを指定した座標に表示
}

function draw() {
    // 画面クリア
    clear();
    background(0);

    // スライダ値を取得
    let slider1Value = slider1.value();
    let slider2Value = slider2.value();

    // ボタン押下イベント
    if (g_ButtonEvent != null) {
        switch (g_ButtonEvent) {
            case ButtonType.Clear:
                clear7SegTable();
                break;
            case ButtonType.Fill:
                fill7SegTable();
                break;
            case ButtonType.Toggle:
                toggle7SegTable();
                break;
            case ButtonType.Import:
                // TODO:
                alert('Not Implemented');
                break;
        }
        g_ButtonEvent = null;
    }

    // マウスイベント
    if (mouseIsPressed) {
        // 白い枠線の円
        noFill();
        strokeWeight(1);
        stroke(255);
        ellipse(mouseX, mouseY, 20, 20); // マウスの位置に小さな白い円を描く
        debugLog(500, 10, `(x, y) = (${Math.floor(mouseX)}, ${Math.floor(mouseY)})`);

        for (let y = 0; y < DigitYCount; y++) {
            for (let x = 0; x < DigitXCount; x++) {
                // 座標・スケールパラメータは描画時と共通にしておくこと
                detectPattern = detectSegmentCollisions(
                    OriginX + x * slider1Value * 2,
                    OriginY + y * slider2Value * 2,
                    0.5,
                    mouseX, mouseY);
                    
                // 左クリックされた箇所のセグメントを点灯
                if (mouseButton === LEFT) {
                    g_7SegTable[y][x] |= detectPattern;
                }
                // 右クリックされた箇所のセグメントを消灯
                if (mouseButton === RIGHT) {
                    g_7SegTable[y][x] &= ~detectPattern;
                }
            }
        }
    }

    // データテーブルを表示
    for (let y = 0; y < DigitYCount; y++) {
        for (let x = 0; x < DigitXCount; x++) {
            displayPattern(
                OriginX + x * slider1Value * 2,
                OriginY + y * slider2Value * 2,
                0.5,
                g_7SegTable[y][x]);
        }
    }

    // 現状のデータの16進数データを更新 (テキスト領域)
    updateHtmlHexString(g_7SegTable);

    const currentHexOneline = convertToHexOneline(g_7SegTable);
    if (currentHexOneline !== g_PreviousHexOneline) {
        g_PreviousHexOneline = currentHexOneline;
        g_Socket.emit('7segUpdated', currentHexOneline);
    }

    /*
    // DEBUG: 
    displayNumber(500, 500, 0.2, Math.floor(slider1Value / 10) % 10);
    displayNumber(530, 500, 0.2, slider1Value % 10);
    */
}

function updateValue() {
    let slider1Value = slider1.value();   // スライダーの値を取得
    select('#slider1-value').html("X = " + slider1Value);  // 値を表示する <p> 要素を更新
    let slider2Value = slider2.value();
    select('#slider2-value').html("Y = " + slider2Value);

    console.log(`Slider1 Value: ${slider1Value}`);
    console.log(`Slider2 Value: ${slider2Value}`);
}

function onButtonClearClicked() {
    g_ButtonEvent = ButtonType.Clear;
}

function onButtonFillClicked() {
    g_ButtonEvent = ButtonType.Fill;
}

function onButtonToggleClicked() {
    g_ButtonEvent = ButtonType.Toggle;
}

function onButtonImportClicked() {
    g_ButtonEvent = ButtonType.Import;
}

// 右クリック時にブラウザでメニューが表示されるのを防止する
document.addEventListener("contextmenu", (e) => {
    e.preventDefault(); // デフォルトの右クリックメニューを無効化
});
