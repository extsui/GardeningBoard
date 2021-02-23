/* ���̃t�@�C���� PatternConverter �ɂ���Ď�����������܂��� */
static const unsigned char Grass_AllOn[1][11] = {
  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, },
};

static const unsigned char Grass_AllOff[1][11] = {
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
};

static const unsigned char Grass_LeftToRight1[12][11] = {
  { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
};

static const unsigned char Grass_RightToLeft1[12][11] = {
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
};

static const unsigned char Grass_LeftToRight3[14][11] = {
  { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
};

static const unsigned char Grass_RightToLeft3[14][11] = {
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, },
  { 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, },
  { 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, },
  { 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, },
  { 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, },
  { 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, },
  { 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, },
  { 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, },
  { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
};

static const unsigned char Grass_BothEdgeToMiddle[12][11] = {
  { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, },
  { 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, },
  { 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, },
  { 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, },
  { 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, },
  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, },
  { 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, },
  { 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, },
  { 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, },
  { 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
};

static const unsigned char Grass_Vibration[2][11] = {
  { 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, },
  { 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, },
};

static const unsigned char Grass_LeftToRightBuffer[134][11] = {
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, },
  { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, },
  { 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, },
  { 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, },
  { 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, },
  { 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, },
  { 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, },
  { 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, },
  { 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, },
  { 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, },
  { 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, },
  { 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, },
  { 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, },
  { 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, },
  { 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, },
  { 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, },
  { 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, },
  { 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, },
  { 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, },
  { 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, },
  { 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, },
  { 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, },
  { 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, },
  { 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, },
  { 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, },
  { 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, },
  { 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, },
  { 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, },
  { 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, },
  { 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, },
  { 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, },
  { 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, },
  { 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, },
  { 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, },
  { 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, },
  { 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, },
  { 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, },
  { 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, },
  { 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, },
  { 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, },
  { 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, },
  { 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, },
  { 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, },
  { 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, },
  { 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, },
  { 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, },
  { 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, },
  { 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, },
  { 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, },
  { 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, },
  { 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, },
  { 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, },
  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, },
  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, },
  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, },
  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, },
  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, },
  { 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, },
  { 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, },
  { 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, },
  { 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, },
  { 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, },
  { 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, },
  { 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, },
  { 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, },
  { 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, },
  { 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, },
  { 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, },
  { 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, },
  { 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, },
  { 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, },
  { 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, },
  { 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, },
  { 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, },
  { 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, },
  { 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, },
  { 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, },
  { 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, },
  { 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, },
  { 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, },
  { 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, },
  { 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, },
  { 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, },
  { 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, },
  { 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, },
  { 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, },
  { 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, },
  { 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, },
  { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, },
  { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, },
  { 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, },
  { 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, },
  { 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, },
  { 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, },
  { 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, },
  { 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, },
  { 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, },
  { 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, },
  { 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, },
  { 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, },
  { 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, },
  { 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, },
  { 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, },
  { 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, },
  { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, },
  { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
};

static const unsigned char Grass_LeftToRightNeg[14][11] = {
  { 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, },
  { 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, },
  { 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, },
  { 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, },
  { 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, },
  { 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, },
  { 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, },
  { 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, },
  { 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, },
  { 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, },
  { 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, },
  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, },
  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, },
  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, },
};

static const unsigned char Grass_RightToLeftNeg[14][11] = {
  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, },
  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, },
  { 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, },
  { 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, },
  { 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, },
  { 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, },
  { 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, },
  { 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, },
  { 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, },
  { 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, },
  { 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, },
  { 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, },
  { 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, },
  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, },
};

static const unsigned char Grass_LeftToRightVertical[8][11] = {
  { 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
};

static const unsigned char Grass_RightToLeftVertical[8][11] = {
  { 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, },
  { 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, },
  { 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
};
