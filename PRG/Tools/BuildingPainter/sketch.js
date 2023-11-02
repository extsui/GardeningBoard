// スライダー要素を格納する変数
let slider1;
let slider2;

// 7セグメントLEDのセグメントを描画する関数
function drawSegment(x, y, w, h, on) {
    stroke(0);
    strokeWeight(0);
    fill(on ? color(255, 0, 0) : color(200)); // 赤色で塗りつぶす
    rect(x, y, w, h);
}

// パターンを表示する関数
function displayPattern(x, y, scale, pattern) {
    // a, g, d セグ (横方向セグメント)
    const horizontalSegmentHeightBase = 10 + 5;
    const horizontalSegmentWidthBase = 40 + 5;
    // b, c, e, f セグ (縦方向セグメント)
    const verticalSegmentHeightBase = 40 + 5;
    const verticalSegmentWidthBase = 10 + 5;
    // セグメント間の隙間
    const segmentGapBase = 10;
    // セグメント原点 (f セグの x 座標, a セグの y 座標)
    const segmentOriginXBase = 10;
    const segmentOriginYBase = 10;

    let horizontalSegmentHeight = horizontalSegmentHeightBase * scale;
    let horizontalSegmentWidth = horizontalSegmentWidthBase * scale;
    let verticalSegmentHeight = verticalSegmentHeightBase * scale;
    let verticalSegmentWidth = verticalSegmentWidthBase * scale;
    let segmentGap = segmentGapBase * scale;
    let segmentOriginX = segmentOriginXBase * scale;
    let segmentOriginY = segmentOriginYBase * scale;

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

// 数字を表示する関数
function displayNumber(x, y, scale, number) {
    const segments = [
        [true, true, true, true, true, true, false], // 数字0
        [false, true, true, false, false, false, false], // 数字1
        [true, true, false, true, true, false, true], // 数字2
        [true, true, true, true, false, false, true], // 数字3
        [false, true, true, false, false, true, true], // 数字4
        [true, false, true, true, false, true, true], // 数字5
        [true, false, true, true, true, true, true], // 数字6
        [true, true, true, false, false, false, false], // 数字7
        [true, true, true, true, true, true, true], // 数字8
        [true, true, true, true, false, true, true], // 数字9
    ];
    
    patternArray = segments[number];
    pattern = 0x00;
    pattern |= (patternArray[0]) ? (1<<7) : 0;
    pattern |= (patternArray[1]) ? (1<<6) : 0;
    pattern |= (patternArray[2]) ? (1<<5) : 0;
    pattern |= (patternArray[3]) ? (1<<4) : 0;
    pattern |= (patternArray[4]) ? (1<<3) : 0;
    pattern |= (patternArray[5]) ? (1<<2) : 0;
    pattern |= (patternArray[6]) ? (1<<1) : 0;
    pattern |= (patternArray[7]) ? (1<<0) : 0;
    displayPattern(x, y, scale, pattern);
}

function setup() {
    createCanvas(600, 800); // キャンバスのサイズを設定
    background(0);

    slider1 = select('#slider1');
    slider1.input(updateValue);

    slider2 = select('#slider2');
    slider2.input(updateValue);
}

function draw() {
    // 画面クリア
    clear();
    background(0);

    // スライダ値を取得
    let slider1Value = slider1.value();
    let slider2Value = slider2.value();
/*
    // スライダ値のデバッグ表示
    strokeWeight(0);
    textSize(24);
    text(`Slider1 Value: ${slider1Value}`, 100, 30);
    text(`Slider2 Value: ${slider2Value}`, 100, 60);
*/
    if (mouseIsPressed) {
        stroke(0);             // 線の色を黒に設定
        strokeWeight(4);       // 線の太さを設定
        line(pmouseX, pmouseY, mouseX, mouseY); // 前回のマウス位置から現在の位置まで線を引く
    }

    const OriginX = 10;
    const OriginY = 10;

    for (let y = 0; y < 6; y++) {
        for (let x = 0; x < 6; x++) {
            displayPattern(
                OriginX + x * slider1Value * 2,
                OriginY + y * slider2Value * 2,
                0.5, 0xFF);
        }
    }
}

function updateValue() {
    let slider1Value = slider1.value();   // スライダーの値を取得
    select('#slider1-value').html("X = " + slider1Value);  // 値を表示する <p> 要素を更新
    let slider2Value = slider2.value();
    select('#slider2-value').html("Y = " + slider2Value);

    console.log(`Slider1 Value: ${slider1Value}`);
    console.log(`Slider2 Value: ${slider2Value}`);
}
