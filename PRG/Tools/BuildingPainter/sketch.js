let slider; // スライダー要素を格納する変数

function setup() {
    createCanvas(600, 800); // キャンバスのサイズを設定
    background(255 - 10);       // 白い背景を設定

    slider = select('#slider'); // スライダー要素を id で取得
    slider.input(updateValue);  // スライダーの値が変更されたときに updateValue 関数を呼び出す

    noLoop();
}

function draw() {
    let sliderValue = slider.value();   // スライダーの値を取得
    strokeWeight(0);
    textSize(24);
    text(`Slider Value: ${sliderValue}`, 20, 100);

    if (mouseIsPressed) {
        stroke(0);             // 線の色を黒に設定
        strokeWeight(4);       // 線の太さを設定
        line(pmouseX, pmouseY, mouseX, mouseY); // 前回のマウス位置から現在の位置まで線を引く
    }

    // 7セグメントLEDのセグメントを描画する関数
    function drawSegment(x, y, w, h, on) {
        stroke(0);
        strokeWeight(0);
        fill(on ? color(255, 0, 0) : color(200)); // 赤色で塗りつぶす
        rect(x, y, w, h);
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

        // a, g, d セグ (横方向セグメント)
        const horizontalSegmentHeight = 10;
        const horizontalSegmentWidth = 40;
        // b, c, e, f セグ (縦方向セグメント)
        const verticalSegmentHeight = 40;
        const verticalSegmentWidth = 10;
        // セグメント間の隙間
        const segmentGap = 10;
        // セグメント原点 (f セグの x 座標, a セグの y 座標)
        const segmentOriginX = 10;
        const segmentOriginY = 10;

        if (number >= 0 && number <= 9) {
            const segmentPattern = segments[number];
            for (let j = 0; j < 7; j++) {
                const on = segmentPattern[j];
                switch (j) {
                    case 0: // a
                        drawSegment(x + segmentOriginX + verticalSegmentWidth + segmentGap, y + segmentOriginY, horizontalSegmentWidth, horizontalSegmentHeight, on);
                        break;
                    case 1: // b
                        drawSegment(x + segmentOriginX + (verticalSegmentWidth + segmentGap) + horizontalSegmentWidth + segmentGap, y + segmentOriginY + (horizontalSegmentHeight + segmentGap), verticalSegmentWidth, verticalSegmentHeight, on);
                        break;
                    case 2: // c
                        drawSegment(x + segmentOriginX + (verticalSegmentWidth + segmentGap) + horizontalSegmentWidth + segmentGap, y + segmentOriginY + (horizontalSegmentHeight + segmentGap) + verticalSegmentHeight + (horizontalSegmentHeight + segmentGap * 2), verticalSegmentWidth, verticalSegmentHeight, on);
                        break;
                    case 3: // d
                        drawSegment(x + segmentOriginX + verticalSegmentWidth + segmentGap, y + segmentOriginY + (horizontalSegmentHeight + segmentGap) + (verticalSegmentHeight + segmentGap) + (horizontalSegmentHeight + segmentGap + verticalSegmentHeight + segmentGap), horizontalSegmentWidth, horizontalSegmentHeight, on);
                        break;
                    case 4: // e
                        drawSegment(x + segmentOriginX, y + segmentOriginY + (horizontalSegmentHeight + segmentGap) + verticalSegmentHeight + (horizontalSegmentHeight + segmentGap * 2), verticalSegmentWidth, verticalSegmentHeight, on);
                        break;
                    case 5: // f
                        drawSegment(x + segmentOriginX, y + segmentOriginY + (horizontalSegmentHeight + segmentGap), verticalSegmentWidth, verticalSegmentHeight, on);
                        break;
                    case 6: // g
                        drawSegment(x + segmentOriginX + verticalSegmentWidth + segmentGap, y + segmentOriginY + (horizontalSegmentHeight + segmentGap) + (verticalSegmentHeight + segmentGap), horizontalSegmentWidth, horizontalSegmentHeight, on);
                        break;
                    default:
                        break;
                }
            }
        }
    }

    // 数字8を表示（スケール値を2としています）
    displayNumber(50, 50, 2, 8);

    // 数字8を表示
    displayNumber(300, 50, 1, 8);

    // 数字8を表示
    displayNumber(50, 50, 0.5, 8);

}

function updateValue() {
    let sliderValue = slider.value();   // スライダーの値を取得
    select('#slider-value').html(sliderValue);  // 値を表示する <p> 要素を更新

    console.log(`Slider Value: ${sliderValue}`);
}
