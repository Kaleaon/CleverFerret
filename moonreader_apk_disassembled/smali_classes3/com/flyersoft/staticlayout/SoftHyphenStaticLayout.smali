.class public Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;
.super Lcom/flyersoft/staticlayout/MyLayout;
.source "SoftHyphenStaticLayout.java"


# static fields
.field private static final COLUMNS_ELLIPSIZE:I = 0x6

.field private static final COLUMNS_NORMAL:I = 0x4

.field public static final DESCENT:I = 0x2

.field private static final DIR:I = 0x0

.field public static final DIRS_ALL_LEFT_TO_RIGHT:Lcom/flyersoft/staticlayout/MyLayout$Directions;

.field static final DIRS_ALL_RIGHT_TO_LEFT:Lcom/flyersoft/staticlayout/MyLayout$Directions;

.field private static final DIR_SHIFT:I = 0x1e

.field private static final ELLIPSIS_COUNT:I = 0x5

.field private static final ELLIPSIS_START:I = 0x4

.field private static final FIRST_CJK:C = '\u2e80'

.field private static final FIRST_RIGHT_TO_LEFT:C = '\u0590'

.field private static final HYPHEN:I = 0x1

.field private static final HYPHEN_MASK:I = 0x20000000

.field public static final SEP:I = 0x3

.field private static final SEPIND:I = 0x1

.field private static final SEP_MASK:I = 0x40000000

.field private static final START:I = 0x0

.field private static final START_MASK:I = 0x1fffffff

.field private static final TAB:I = 0x0

.field private static final TAB_INCREMENT:I = 0x14

.field private static final TAB_MASK:I = 0x20000000

.field public static final TOP:I = 0x1

.field private static final TOP_MASK:I = 0x1fffffff


# instance fields
.field ascentTmp:I

.field bottomTmp:I

.field descentTmp:I

.field floatSp:Lcom/flyersoft/staticlayout/MyFloatSpan;

.field float_width:F

.field private mBottomPadding:I

.field private mChdirs:[B

.field private mChs:[C

.field public mColumns:I

.field private mEllipsizedWidth:I

.field public mFontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;

.field private mHyphenWidth:F

.field private mIsBidirectional:Z

.field private mIsCJK:Z

.field public mLineCount:I

.field public mLineDirections:[Lcom/flyersoft/staticlayout/MyLayout$Directions;

.field public mLines:[I

.field private mSpaceWidth:F

.field private mTopPadding:I

.field private mWidths:[F

.field private maxExtra:I

.field topTmp:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1247
    new-instance v0, Lcom/flyersoft/staticlayout/MyLayout$Directions;

    const/4 v1, 0x1

    new-array v1, v1, [S

    const/16 v2, 0x7fff

    const/4 v3, 0x0

    aput-short v2, v1, v3

    invoke-direct {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout$Directions;-><init>([S)V

    sput-object v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->DIRS_ALL_LEFT_TO_RIGHT:Lcom/flyersoft/staticlayout/MyLayout$Directions;

    .line 1249
    new-instance v0, Lcom/flyersoft/staticlayout/MyLayout$Directions;

    const/4 v1, 0x2

    new-array v1, v1, [S

    fill-array-data v1, :array_0

    invoke-direct {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout$Directions;-><init>([S)V

    sput-object v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->DIRS_ALL_RIGHT_TO_LEFT:Lcom/flyersoft/staticlayout/MyLayout$Directions;

    return-void

    nop

    :array_0
    .array-data 2
        0x0s
        0x7fffs
    .end array-data
.end method

.method public constructor <init>(Lcom/flyersoft/staticlayout/MyTextView;Ljava/lang/CharSequence;IILandroid/text/TextPaint;ILcom/flyersoft/staticlayout/MyLayout$Alignment;FFZ)V
    .locals 13

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move-object/from16 v5, p5

    move/from16 v6, p6

    move-object/from16 v7, p7

    move/from16 v8, p8

    move/from16 v9, p9

    move/from16 v10, p10

    .line 63
    invoke-direct/range {v0 .. v12}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;-><init>(Lcom/flyersoft/staticlayout/MyTextView;Ljava/lang/CharSequence;IILandroid/text/TextPaint;ILcom/flyersoft/staticlayout/MyLayout$Alignment;FFZLcom/flyersoft/staticlayout/TextUtils$TruncateAt;I)V

    return-void
.end method

.method public constructor <init>(Lcom/flyersoft/staticlayout/MyTextView;Ljava/lang/CharSequence;IILandroid/text/TextPaint;ILcom/flyersoft/staticlayout/MyLayout$Alignment;FFZLcom/flyersoft/staticlayout/TextUtils$TruncateAt;I)V
    .locals 14

    move-object v0, p0

    move-object v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p5

    move/from16 v4, p6

    move-object/from16 v5, p7

    move/from16 v6, p8

    move/from16 v7, p9

    .line 71
    invoke-direct/range {v0 .. v7}, Lcom/flyersoft/staticlayout/MyLayout;-><init>(Lcom/flyersoft/staticlayout/MyTextView;Ljava/lang/CharSequence;Landroid/text/TextPaint;ILcom/flyersoft/staticlayout/MyLayout$Alignment;FF)V

    const/4 v1, 0x0

    .line 1649
    iput-boolean v1, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mIsBidirectional:Z

    .line 1650
    iput-boolean v1, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mIsCJK:Z

    .line 1655
    new-instance v2, Landroid/graphics/Paint$FontMetricsInt;

    invoke-direct {v2}, Landroid/graphics/Paint$FontMetricsInt;-><init>()V

    iput-object v2, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mFontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;

    .line 72
    check-cast p1, Lcom/flyersoft/staticlayout/MRTextView;

    iput-object p1, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    const/4 p1, 0x4

    .line 74
    iput p1, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mColumns:I

    .line 75
    iput v4, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mEllipsizedWidth:I

    mul-int/lit8 p1, p1, 0x2

    .line 76
    invoke-static {p1}, Lcom/flyersoft/staticlayout/ArrayUtils;->idealIntArraySize(I)I

    move-result p1

    .line 77
    new-array v2, p1, [I

    iput-object v2, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLines:[I

    .line 78
    new-array p1, p1, [Lcom/flyersoft/staticlayout/MyLayout$Directions;

    iput-object p1, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineDirections:[Lcom/flyersoft/staticlayout/MyLayout$Directions;

    .line 81
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookType()I

    move-result p1

    const/4 v2, 0x7

    if-eq p1, v2, :cond_1

    sget-object p1, Lcom/flyersoft/tools/A;->txtLay:Landroid/view/View;

    if-eqz p1, :cond_1

    sget-object p1, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz p1, :cond_1

    .line 82
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->getTv()Lcom/flyersoft/staticlayout/MRTextView;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth()I

    move-result p1

    if-eqz p1, :cond_3

    if-nez v4, :cond_0

    goto :goto_1

    .line 85
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/A;->dualPageEnabled()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 86
    sget-object v2, Lcom/flyersoft/tools/A;->txtScroll2:Landroid/widget/ScrollView;

    invoke-virtual {v2}, Landroid/widget/ScrollView;->getWidth()I

    move-result v2

    .line 87
    sget-object v3, Lcom/flyersoft/tools/A;->baseFrame:Landroid/widget/FrameLayout;

    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    add-int/lit8 v3, v3, 0x2

    if-gt p1, v3, :cond_3

    if-gt v4, v3, :cond_3

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    if-eqz p11, :cond_2

    const/4 v1, 0x1

    const/4 v11, 0x1

    goto :goto_0

    :cond_2
    const/4 v11, 0x0

    :goto_0
    move/from16 p1, p12

    int-to-float v12, p1

    move/from16 v10, p10

    move-object v0, p0

    move-object/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    move-object/from16 v6, p7

    move/from16 v7, p8

    move/from16 v8, p9

    move/from16 v9, p10

    move-object/from16 v13, p11

    move v5, v4

    move-object/from16 v4, p5

    .line 94
    invoke-virtual/range {v0 .. v13}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->generate(Ljava/lang/CharSequence;IILandroid/text/TextPaint;ILcom/flyersoft/staticlayout/MyLayout$Alignment;FFZZZFLcom/flyersoft/staticlayout/TextUtils$TruncateAt;)V

    :cond_3
    :goto_1
    const/4 p1, 0x0

    .line 102
    iput-object p1, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mChdirs:[B

    .line 103
    iput-object p1, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mChs:[C

    .line 104
    iput-object p1, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mWidths:[F

    .line 105
    iput-object p1, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mFontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;

    return-void
.end method

.method public constructor <init>(Lcom/flyersoft/staticlayout/MyTextView;Ljava/lang/CharSequence;Landroid/text/TextPaint;ILcom/flyersoft/staticlayout/MyLayout$Alignment;FFZ)V
    .locals 11

    const/4 v3, 0x0

    .line 57
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    move-result v4

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    move v6, p4

    move-object/from16 v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    invoke-direct/range {v0 .. v10}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;-><init>(Lcom/flyersoft/staticlayout/MyTextView;Ljava/lang/CharSequence;IILandroid/text/TextPaint;ILcom/flyersoft/staticlayout/MyLayout$Alignment;FFZ)V

    return-void
.end method

.method public static isConnectChar(C)Z
    .locals 1

    const/16 v0, 0x2d

    if-eq p0, v0, :cond_1

    const/16 v0, 0x2014

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method private isHyphenation()Z
    .locals 1

    .line 109
    sget-boolean v0, Lcom/flyersoft/tools/A;->textHyphenation:Z

    return v0
.end method

.method private static final isIdeographic(CZ)Z
    .locals 4

    const/16 v0, 0x2e80

    const/4 v1, 0x1

    if-lt p0, v0, :cond_0

    const/16 v0, 0x2fff

    if-gt p0, v0, :cond_0

    return v1

    :cond_0
    const/16 v0, 0x3000

    if-ne p0, v0, :cond_1

    return v1

    :cond_1
    const/16 v0, 0x3040

    const/4 v2, 0x0

    if-lt p0, v0, :cond_4

    const/16 v0, 0x309f

    if-gt p0, v0, :cond_4

    if-nez p1, :cond_3

    const/16 p1, 0x3041

    if-eq p0, p1, :cond_2

    const/16 p1, 0x3043

    if-eq p0, p1, :cond_2

    const/16 p1, 0x3045

    if-eq p0, p1, :cond_2

    const/16 p1, 0x3047

    if-eq p0, p1, :cond_2

    const/16 p1, 0x3049

    if-eq p0, p1, :cond_2

    const/16 p1, 0x3063

    if-eq p0, p1, :cond_2

    const/16 p1, 0x3083

    if-eq p0, p1, :cond_2

    const/16 p1, 0x3085

    if-eq p0, p1, :cond_2

    const/16 p1, 0x3087

    if-eq p0, p1, :cond_2

    const/16 p1, 0x308e

    if-eq p0, p1, :cond_2

    const/16 p1, 0x3095

    if-eq p0, p1, :cond_2

    const/16 p1, 0x3096

    if-eq p0, p1, :cond_2

    packed-switch p0, :pswitch_data_0

    goto :goto_0

    :cond_2
    :pswitch_0
    return v2

    :cond_3
    :goto_0
    return v1

    :cond_4
    const/16 v0, 0x30a0

    if-lt p0, v0, :cond_7

    const/16 v3, 0x30ff

    if-gt p0, v3, :cond_7

    if-nez p1, :cond_6

    if-eq p0, v0, :cond_5

    const/16 p1, 0x30a1

    if-eq p0, p1, :cond_5

    const/16 p1, 0x30a3

    if-eq p0, p1, :cond_5

    const/16 p1, 0x30a5

    if-eq p0, p1, :cond_5

    const/16 p1, 0x30a7

    if-eq p0, p1, :cond_5

    const/16 p1, 0x30a9

    if-eq p0, p1, :cond_5

    const/16 p1, 0x30c3

    if-eq p0, p1, :cond_5

    const/16 p1, 0x30e3

    if-eq p0, p1, :cond_5

    const/16 p1, 0x30e5

    if-eq p0, p1, :cond_5

    const/16 p1, 0x30e7

    if-eq p0, p1, :cond_5

    const/16 p1, 0x30ee

    if-eq p0, p1, :cond_5

    const/16 p1, 0x30f5

    if-eq p0, p1, :cond_5

    const/16 p1, 0x30f6

    if-eq p0, p1, :cond_5

    packed-switch p0, :pswitch_data_1

    goto :goto_1

    :cond_5
    :pswitch_1
    return v2

    :cond_6
    :goto_1
    return v1

    :cond_7
    const/16 p1, 0x3400

    if-lt p0, p1, :cond_8

    const/16 p1, 0x4db5

    if-gt p0, p1, :cond_8

    return v1

    :cond_8
    const/16 p1, 0x4e00

    if-lt p0, p1, :cond_9

    const p1, 0x9fbb

    if-gt p0, p1, :cond_9

    return v1

    :cond_9
    const p1, 0xf900

    if-lt p0, p1, :cond_a

    const p1, 0xfad9

    if-gt p0, p1, :cond_a

    return v1

    :cond_a
    const p1, 0xa000

    if-lt p0, p1, :cond_b

    const p1, 0xa48f

    if-gt p0, p1, :cond_b

    return v1

    :cond_b
    const p1, 0xa490

    if-lt p0, p1, :cond_c

    const p1, 0xa4cf

    if-gt p0, p1, :cond_c

    return v1

    :cond_c
    const p1, 0xfe62

    if-lt p0, p1, :cond_d

    const p1, 0xfe66

    if-gt p0, p1, :cond_d

    return v1

    :cond_d
    const p1, 0xff10

    if-lt p0, p1, :cond_e

    const p1, 0xff19

    if-gt p0, p1, :cond_e

    return v1

    :cond_e
    return v2

    nop

    :pswitch_data_0
    .packed-switch 0x309b
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x30fb
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public static isLeftQuote(C)Z
    .locals 3

    const/16 v0, 0x201c

    if-eq p0, v0, :cond_1

    const/16 v0, 0x2018

    if-eq p0, v0, :cond_1

    const/16 v0, 0x201e

    if-eq p0, v0, :cond_1

    const/16 v0, 0x28

    if-eq p0, v0, :cond_1

    const/16 v0, 0x3c

    if-eq p0, v0, :cond_1

    const/16 v0, 0x5b

    if-eq p0, v0, :cond_1

    const/16 v1, 0x7b

    if-eq p0, v1, :cond_1

    const/16 v2, 0xbb

    if-eq p0, v2, :cond_1

    const/16 v2, 0x203a

    if-eq p0, v2, :cond_1

    const/16 v2, 0xab

    if-eq p0, v2, :cond_1

    const/16 v2, 0x2039

    if-eq p0, v2, :cond_1

    const/16 v2, 0xbf

    if-eq p0, v2, :cond_1

    const/16 v2, 0xa1

    if-eq p0, v2, :cond_1

    const/16 v2, 0x300a

    if-eq p0, v2, :cond_1

    const/16 v2, 0x3008

    if-eq p0, v2, :cond_1

    const v2, 0xff08

    if-eq p0, v2, :cond_1

    const/16 v2, 0x300c

    if-eq p0, v2, :cond_1

    if-eq p0, v0, :cond_1

    if-ne p0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public static isRightQuote(C)Z
    .locals 1

    const/16 v0, 0x201d

    if-eq p0, v0, :cond_1

    const/16 v0, 0x22

    if-eq p0, v0, :cond_1

    const/16 v0, 0x29

    if-eq p0, v0, :cond_1

    const/16 v0, 0x3e

    if-eq p0, v0, :cond_1

    const/16 v0, 0xab

    if-eq p0, v0, :cond_1

    const/16 v0, 0x2039

    if-eq p0, v0, :cond_1

    const/16 v0, 0x2018

    if-eq p0, v0, :cond_1

    const/16 v0, 0xbb

    if-eq p0, v0, :cond_1

    const/16 v0, 0x203a

    if-eq p0, v0, :cond_1

    const/16 v0, 0x300b

    if-eq p0, v0, :cond_1

    const/16 v0, 0x3009

    if-eq p0, v0, :cond_1

    const v0, 0xff09

    if-eq p0, v0, :cond_1

    const/16 v0, 0x300d

    if-eq p0, v0, :cond_1

    const/16 v0, 0x5d

    if-eq p0, v0, :cond_1

    const/16 v0, 0x7d

    if-eq p0, v0, :cond_1

    .line 1239
    invoke-static {p0}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isSingleQuote(C)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public static isSingleQuote(C)Z
    .locals 1

    const/16 v0, 0x27

    if-eq p0, v0, :cond_1

    const/16 v0, 0x2019

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method private out(Ljava/lang/CharSequence;IIIIIIIFF[Landroid/text/style/LineHeightSpan;[ILandroid/graphics/Paint$FontMetricsInt;ZZI[BIZZZZ[FIILcom/flyersoft/staticlayout/TextUtils$TruncateAt;FFLandroid/text/TextPaint;)I
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p11

    move-object/from16 v3, p13

    sub-int v4, p3, p2

    const/16 v5, 0xa

    const/4 v7, 0x1

    if-ne v4, v7, :cond_1

    .line 1362
    invoke-interface/range {p1 .. p2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v8

    if-ne v8, v5, :cond_1

    .line 1363
    sget-boolean v8, Lcom/flyersoft/tools/A;->trimBlankSpace:Z

    if-nez v8, :cond_0

    sget v8, Lcom/flyersoft/tools/A;->paragraphSpace:I

    if-eqz v8, :cond_0

    if-lez p2, :cond_1

    add-int/lit8 v8, p2, -0x1

    invoke-interface {v1, v8}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v8

    if-eq v8, v5, :cond_1

    :cond_0
    move/from16 v8, p8

    goto :goto_0

    :cond_1
    const/4 v8, -0x1

    .line 1366
    :goto_0
    sget v9, Lcom/flyersoft/tools/A;->paragraphSpace:I

    if-eq v9, v5, :cond_2

    const/4 v9, 0x5

    if-ge v4, v9, :cond_2

    .line 1367
    invoke-static/range {p1 .. p3}, Lcom/flyersoft/tools/A;->isEmtpyText(Ljava/lang/CharSequence;II)Z

    move-result v9

    goto :goto_1

    :cond_2
    const/4 v9, 0x0

    .line 1370
    :goto_1
    iget v11, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineCount:I

    .line 1371
    iget v12, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mColumns:I

    mul-int v13, v11, v12

    add-int/2addr v12, v13

    add-int/2addr v12, v7

    .line 1373
    invoke-direct {v0, v12}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->verifymLines(I)V

    move/from16 v12, p4

    if-eqz v2, :cond_4

    .line 1377
    iput v12, v3, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    move/from16 v14, p5

    .line 1378
    iput v14, v3, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    move/from16 v15, p6

    .line 1379
    iput v15, v3, Landroid/graphics/Paint$FontMetricsInt;->top:I

    move/from16 v12, p7

    .line 1380
    iput v12, v3, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    const/4 v12, 0x0

    .line 1382
    :goto_2
    array-length v14, v2

    if-ge v12, v14, :cond_3

    .line 1383
    aget-object v14, v2, v12

    aget v15, p12, v12

    move/from16 p25, p2

    move/from16 p26, p3

    move/from16 p28, p8

    move-object/from16 p24, v1

    move-object/from16 p29, v3

    move-object/from16 p23, v14

    move/from16 p27, v15

    invoke-interface/range {p23 .. p29}, Landroid/text/style/LineHeightSpan;->chooseHeight(Ljava/lang/CharSequence;IIIILandroid/graphics/Paint$FontMetricsInt;)V

    move-object/from16 v3, p24

    move/from16 v1, p25

    move-object/from16 v14, p29

    add-int/lit8 v12, v12, 0x1

    move-object v1, v3

    move-object v3, v14

    goto :goto_2

    :cond_3
    move-object v14, v3

    move-object v3, v1

    move/from16 v1, p2

    .line 1386
    iget v2, v14, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    .line 1387
    iget v12, v14, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 1388
    iget v15, v14, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 1389
    iget v14, v14, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    move/from16 v16, v14

    move v14, v12

    move v12, v2

    move/from16 v10, p8

    const/16 p23, 0x0

    move/from16 v2, p3

    goto :goto_3

    :cond_4
    move/from16 v14, p5

    move/from16 v15, p6

    move-object v3, v1

    move/from16 v1, p2

    move/from16 v16, p7

    move/from16 v2, p3

    move/from16 v10, p8

    const/16 p23, 0x0

    :goto_3
    if-nez v11, :cond_6

    if-eqz p22, :cond_5

    sub-int v6, v15, v12

    .line 1394
    iput v6, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mTopPadding:I

    :cond_5
    if-eqz p21, :cond_6

    move v12, v15

    :cond_6
    if-eqz p20, :cond_8

    if-eqz p22, :cond_7

    sub-int v6, v16, v14

    .line 1400
    iput v6, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mBottomPadding:I

    :cond_7
    if-eqz p21, :cond_8

    move/from16 v14, v16

    :cond_8
    if-eqz p15, :cond_c

    if-le v2, v1, :cond_a

    .line 1407
    invoke-interface/range {p1 .. p2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v15

    const/high16 p4, 0x3f800000    # 1.0f

    const v6, 0xfffc

    if-ne v15, v6, :cond_b

    if-eq v4, v7, :cond_9

    const/4 v6, 0x2

    if-ne v4, v6, :cond_b

    add-int/lit8 v4, v1, 0x1

    .line 1408
    invoke-interface {v3, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    if-ne v4, v5, :cond_b

    .line 1410
    :cond_9
    invoke-static/range {p4 .. p4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    const/16 p25, 0xa

    goto :goto_4

    :cond_a
    const/high16 p4, 0x3f800000    # 1.0f

    :cond_b
    sub-int v4, v14, v12

    int-to-float v4, v4

    sub-float v6, p9, p4

    mul-float v4, v4, v6

    add-float v4, v4, p10

    const/16 p25, 0xa

    float-to-double v5, v4

    const-wide/high16 v15, 0x3fe0000000000000L    # 0.5

    add-double/2addr v5, v15

    double-to-int v4, v5

    .line 1413
    :goto_4
    iget v5, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->maxExtra:I

    if-le v4, v5, :cond_d

    if-lez v5, :cond_d

    move v4, v5

    goto :goto_5

    :cond_c
    const/16 p25, 0xa

    const/4 v4, 0x0

    .line 1418
    :cond_d
    :goto_5
    iget v5, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineCount:I

    invoke-virtual {v0, v5, v1}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->setLineStart(II)V

    .line 1419
    iget v5, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineCount:I

    if-nez v5, :cond_e

    .line 1420
    invoke-virtual {v0, v5, v10}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->setLineTop(II)V

    :cond_e
    add-int/lit8 v5, v13, 0x2

    .line 1421
    invoke-direct {v0, v5}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->verifymLines(I)V

    .line 1422
    iget-object v6, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLines:[I

    add-int v15, v14, v4

    aput v15, v6, v5

    sub-int/2addr v14, v12

    add-int/2addr v14, v4

    add-int v4, v10, v14

    .line 1426
    iget v5, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineCount:I

    add-int/2addr v5, v7

    invoke-virtual {v0, v5, v2}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->setLineStart(II)V

    .line 1428
    iget-object v5, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->floatSp:Lcom/flyersoft/staticlayout/MyFloatSpan;

    if-eqz v5, :cond_10

    iget v6, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->float_width:F

    const/4 v10, 0x0

    cmpl-float v6, v6, v10

    if-lez v6, :cond_10

    .line 1429
    iget v6, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineCount:I

    iget-boolean v10, v5, Lcom/flyersoft/staticlayout/MyFloatSpan;->isLeft:Z

    if-eqz v10, :cond_f

    iget v10, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->float_width:F

    goto :goto_6

    :cond_f
    iget v10, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->float_width:F

    neg-float v10, v10

    :goto_6
    float-to-int v10, v10

    invoke-virtual {v0, v6, v5, v10}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->setLineFloat(ILcom/flyersoft/staticlayout/MyFloatSpan;I)V

    :cond_10
    if-nez v9, :cond_11

    const/4 v14, 0x0

    :goto_7
    const/4 v5, -0x1

    goto :goto_9

    .line 1431
    :cond_11
    sget v5, Lcom/flyersoft/tools/A;->paragraphSpace:I

    if-lez v5, :cond_12

    sget v5, Lcom/flyersoft/tools/A;->paragraphSpace:I

    mul-int/lit8 v5, v5, 0xa

    goto :goto_8

    :cond_12
    const/16 v5, 0x8

    :goto_8
    rsub-int/lit8 v5, v5, 0x64

    mul-int v14, v14, v5

    div-int/lit8 v14, v14, 0x64

    goto :goto_7

    :goto_9
    if-ne v8, v5, :cond_16

    if-nez v14, :cond_13

    move v5, v4

    goto :goto_b

    :cond_13
    sub-int v5, v4, v14

    .line 1434
    sget v6, Lcom/flyersoft/tools/A;->paragraphSpace:I

    if-lez v6, :cond_14

    sget v6, Lcom/flyersoft/tools/A;->fontSize:F

    const/high16 v9, 0x40e00000    # 7.0f

    div-float/2addr v6, v9

    invoke-static {v6}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v6

    goto :goto_a

    :cond_14
    const/4 v6, 0x0

    :goto_a
    sub-int/2addr v5, v6

    .line 1435
    :goto_b
    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-ne v2, v3, :cond_15

    iget-object v3, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->floatSp:Lcom/flyersoft/staticlayout/MyFloatSpan;

    if-eqz v3, :cond_15

    int-to-float v6, v5

    iget v3, v3, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_v:F

    iget-object v9, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->floatSp:Lcom/flyersoft/staticlayout/MyFloatSpan;

    iget v9, v9, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_height:F

    add-float/2addr v3, v9

    cmpg-float v3, v6, v3

    if-gez v3, :cond_15

    .line 1436
    iget-object v3, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->floatSp:Lcom/flyersoft/staticlayout/MyFloatSpan;

    iget v3, v3, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_v:F

    iget-object v5, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->floatSp:Lcom/flyersoft/staticlayout/MyFloatSpan;

    iget v5, v5, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_height:F

    add-float/2addr v3, v5

    float-to-int v5, v3

    .line 1437
    :cond_15
    iget v3, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineCount:I

    add-int/2addr v3, v7

    invoke-virtual {v0, v3, v5}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->setLineTop(II)V

    goto :goto_c

    .line 1439
    :cond_16
    iget v3, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineCount:I

    add-int/2addr v3, v7

    invoke-virtual {v0, v3, v8}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->setLineTop(II)V

    :goto_c
    if-eqz p14, :cond_17

    .line 1443
    iget-object v3, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLines:[I

    aget v5, v3, v13

    const/high16 v6, 0x20000000

    or-int/2addr v5, v6

    aput v5, v3, v13

    .line 1445
    :cond_17
    iget-object v3, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLines:[I

    aget v5, v3, v13

    shl-int/lit8 v6, p18, 0x1e

    or-int/2addr v5, v6

    aput v5, v3, v13

    if-nez p19, :cond_19

    move v3, v1

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_d
    if-ge v3, v2, :cond_1a

    sub-int v9, v3, p16

    .line 1452
    aget-byte v9, p17, v9

    if-eq v9, v6, :cond_18

    add-int/lit8 v5, v5, 0x1

    move v6, v9

    :cond_18
    add-int/lit8 v3, v3, 0x1

    goto :goto_d

    :cond_19
    const/4 v5, 0x0

    :cond_1a
    if-nez v5, :cond_1b

    .line 1462
    sget-object v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->DIRS_ALL_LEFT_TO_RIGHT:Lcom/flyersoft/staticlayout/MyLayout$Directions;

    goto :goto_f

    :cond_1b
    add-int/2addr v5, v7

    .line 1464
    new-array v3, v5, [S

    move v5, v1

    const/4 v6, 0x0

    const/4 v9, 0x0

    :goto_e
    if-ge v1, v2, :cond_1d

    sub-int v10, v1, p16

    .line 1471
    aget-byte v10, p17, v10

    if-eq v10, v9, :cond_1c

    add-int/lit8 v9, v6, 0x1

    sub-int v5, v1, v5

    int-to-short v5, v5

    .line 1472
    aput-short v5, v3, v6

    move v5, v1

    move v6, v9

    move v9, v10

    :cond_1c
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    :cond_1d
    sub-int v1, v2, v5

    int-to-short v1, v1

    .line 1478
    aput-short v1, v3, v6

    if-ne v6, v7, :cond_1e

    .line 1480
    aget-short v1, v3, p23

    if-nez v1, :cond_1e

    .line 1481
    sget-object v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->DIRS_ALL_RIGHT_TO_LEFT:Lcom/flyersoft/staticlayout/MyLayout$Directions;

    goto :goto_f

    .line 1483
    :cond_1e
    new-instance v1, Lcom/flyersoft/staticlayout/MyLayout$Directions;

    invoke-direct {v1, v3}, Lcom/flyersoft/staticlayout/MyLayout$Directions;-><init>([S)V

    .line 1487
    :goto_f
    iget-object v2, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineDirections:[Lcom/flyersoft/staticlayout/MyLayout$Directions;

    aput-object v1, v2, v11

    .line 1488
    iget v1, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineCount:I

    add-int/2addr v1, v7

    iput v1, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineCount:I

    const/4 v5, -0x1

    if-eq v8, v5, :cond_1f

    return v8

    :cond_1f
    sub-int/2addr v4, v14

    return v4
.end method

.method private verifymLines(I)V
    .locals 4

    .line 1495
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLines:[I

    array-length v0, v0

    if-lt p1, v0, :cond_0

    add-int/lit8 p1, p1, 0x1

    .line 1497
    :try_start_0
    invoke-static {p1}, Lcom/flyersoft/staticlayout/ArrayUtils;->idealIntArraySize(I)I

    move-result p1

    .line 1498
    new-array v0, p1, [I

    .line 1499
    iget-object v1, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLines:[I

    array-length v2, v1

    const/4 v3, 0x0

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1500
    iput-object v0, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLines:[I

    .line 1502
    new-array p1, p1, [Lcom/flyersoft/staticlayout/MyLayout$Directions;

    .line 1503
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineDirections:[Lcom/flyersoft/staticlayout/MyLayout$Directions;

    array-length v1, v0

    invoke-static {v0, v3, p1, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1504
    iput-object p1, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineDirections:[Lcom/flyersoft/staticlayout/MyLayout$Directions;
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 1506
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method


# virtual methods
.method generate(Ljava/lang/CharSequence;IILandroid/text/TextPaint;ILcom/flyersoft/staticlayout/MyLayout$Alignment;FFZZZFLcom/flyersoft/staticlayout/TextUtils$TruncateAt;)V
    .locals 85

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v0, p2

    move/from16 v3, p3

    move-object/from16 v4, p4

    move/from16 v5, p5

    .line 136
    iget-object v6, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz v6, :cond_0

    invoke-static {}, Lcom/flyersoft/tools/A;->dualPageEnabled()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 137
    iget-object v6, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v7

    iput v7, v6, Lcom/flyersoft/staticlayout/MRTextView;->mTextHash:I

    .line 138
    iget-object v6, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    iput v5, v6, Lcom/flyersoft/staticlayout/MRTextView;->outerWidth2:I

    .line 141
    :cond_0
    iget-object v6, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    const/4 v11, 0x1

    if-eqz v6, :cond_1

    .line 142
    iget-object v6, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    iput v11, v6, Lcom/flyersoft/staticlayout/MRTextView;->layoutState:I

    .line 146
    :cond_1
    invoke-direct {v1}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isHyphenation()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 148
    const-string v6, "?"

    invoke-static {v6, v4}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v6

    iput v6, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mHyphenWidth:F

    .line 149
    const-string v6, " "

    invoke-static {v6, v4}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v6

    iput v6, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mSpaceWidth:F

    .line 150
    iget v6, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mHyphenWidth:F

    float-to-int v6, v6

    sub-int/2addr v5, v6

    :cond_2
    move v12, v5

    .line 153
    iget-object v5, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz v5, :cond_3

    .line 154
    iget-object v5, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    iput v12, v5, Lcom/flyersoft/staticlayout/MRTextView;->mInnerWidth:I

    :cond_3
    const/4 v13, 0x0

    .line 157
    iput v13, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineCount:I

    .line 159
    new-instance v5, Landroid/util/SparseIntArray;

    invoke-direct {v5}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v5, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->hyphLines:Landroid/util/SparseIntArray;

    .line 160
    new-instance v5, Landroid/util/SparseIntArray;

    invoke-direct {v5}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v5, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->topAddedLines:Landroid/util/SparseIntArray;

    .line 161
    new-instance v5, Landroid/util/SparseIntArray;

    invoke-direct {v5}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v5, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->topAddedLines2:Landroid/util/SparseIntArray;

    .line 162
    new-instance v5, Landroid/util/SparseIntArray;

    invoke-direct {v5}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v5, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->floatLines:Landroid/util/SparseIntArray;

    .line 163
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    iput-object v5, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->floatLineSpans:Ljava/util/Map;

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v14, 0x0

    cmpl-float v5, p7, v5

    if-nez v5, :cond_5

    cmpl-float v5, p8, v14

    if-eqz v5, :cond_4

    goto :goto_0

    :cond_4
    const/16 v16, 0x0

    goto :goto_1

    :cond_5
    :goto_0
    const/16 v16, 0x1

    .line 168
    :goto_1
    iget-object v6, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mFontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;

    const/16 v15, 0xa

    .line 171
    invoke-static {v2, v15, v0, v3}, Lcom/flyersoft/staticlayout/TextUtils;->indexOf(Ljava/lang/CharSequence;CII)I

    move-result v5

    if-ltz v5, :cond_6

    sub-int v7, v5, v0

    goto :goto_2

    :cond_6
    sub-int v7, v3, v0

    .line 175
    :goto_2
    iget-object v8, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mChdirs:[B

    const/4 v9, 0x2

    if-nez v8, :cond_7

    add-int/2addr v7, v11

    .line 176
    invoke-static {v7}, Lcom/flyersoft/staticlayout/ArrayUtils;->idealByteArraySize(I)I

    move-result v8

    new-array v8, v8, [B

    iput-object v8, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mChdirs:[B

    .line 177
    invoke-static {v7}, Lcom/flyersoft/staticlayout/ArrayUtils;->idealCharArraySize(I)I

    move-result v8

    new-array v8, v8, [C

    iput-object v8, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mChs:[C

    mul-int/lit8 v7, v7, 0x2

    .line 178
    invoke-static {v7}, Lcom/flyersoft/staticlayout/ArrayUtils;->idealIntArraySize(I)I

    move-result v7

    new-array v7, v7, [F

    iput-object v7, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mWidths:[F

    .line 182
    :cond_7
    iget-object v7, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mChdirs:[B

    .line 183
    iget-object v8, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mChs:[C

    .line 184
    iget-object v10, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mWidths:[F

    .line 190
    instance-of v13, v2, Landroid/text/Spanned;

    const/4 v11, 0x0

    if-eqz v13, :cond_8

    .line 191
    move-object/from16 v17, v2

    check-cast v17, Landroid/text/Spanned;

    .line 192
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    const/16 v19, 0xa

    const-string v15, "\ufffc"

    invoke-virtual {v9, v15}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    move/from16 v31, v9

    move-object/from16 v9, v17

    goto :goto_3

    :cond_8
    const/16 v19, 0xa

    .line 194
    iput-object v4, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mWorkPaint:Landroid/text/TextPaint;

    move-object v9, v11

    const/16 v31, 0x0

    .line 202
    :goto_3
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->getTv()Lcom/flyersoft/staticlayout/MRTextView;

    move-result-object v15

    invoke-virtual {v15, v4}, Lcom/flyersoft/staticlayout/MRTextView;->getPaintExtra(Landroid/graphics/Paint;)I

    move-result v15

    const/16 v14, 0xc

    mul-int/lit8 v15, v15, 0xc

    div-int/lit8 v15, v15, 0xa

    iput v15, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->maxExtra:I

    .line 203
    iput-object v11, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->floatSp:Lcom/flyersoft/staticlayout/MyFloatSpan;

    const/4 v15, 0x0

    .line 204
    iput v15, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->float_width:F

    int-to-float v15, v12

    const v20, 0x3eb33333    # 0.35f

    mul-float v32, v15, v20

    const/16 v33, -0x1

    move/from16 v24, v5

    move-object v14, v7

    move-object v5, v11

    move/from16 v22, v13

    const/4 v7, 0x0

    const/16 v23, 0x1

    const/16 v25, -0x1

    move v13, v0

    move-object v11, v8

    move-object v0, v10

    move-object v10, v5

    const/4 v8, 0x0

    :goto_4
    const/16 v34, 0x1

    if-gt v13, v3, :cond_10f

    if-eqz v23, :cond_9

    move/from16 v26, v15

    const/16 v35, 0x0

    goto :goto_5

    :cond_9
    move/from16 v26, v15

    const/16 v15, 0xa

    .line 213
    invoke-static {v2, v15, v13, v3}, Lcom/flyersoft/staticlayout/TextUtils;->indexOf(Ljava/lang/CharSequence;CII)I

    move-result v24

    move/from16 v35, v23

    :goto_5
    if-gez v24, :cond_a

    move v15, v3

    goto :goto_6

    :cond_a
    add-int/lit8 v24, v24, 0x1

    move/from16 v15, v24

    :goto_6
    const/high16 v36, 0x40c00000    # 6.0f

    if-eqz v9, :cond_29

    .line 232
    invoke-direct {v1}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isHyphenation()Z

    move-result v23

    if-eqz v23, :cond_c

    .line 233
    const-class v3, Ljava/lang/Object;

    invoke-interface {v9, v13, v15, v3}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v24, v6

    .line 234
    const-class v6, Lcom/flyersoft/staticlayout/MyImageSpan;

    invoke-static {v3, v6}, Lcom/flyersoft/tools/T;->spansHasKind([Ljava/lang/Object;Ljava/lang/Class;)Z

    move-result v6

    if-nez v6, :cond_b

    .line 236
    invoke-static {v3, v9, v13, v15}, Lcom/flyersoft/staticlayout/MRTextView;->getAlignmentSpan([Ljava/lang/Object;Landroid/text/Spanned;II)Lcom/flyersoft/staticlayout/AlignmentSpan;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/staticlayout/MRTextView;->getAlign(Lcom/flyersoft/staticlayout/AlignmentSpan;)I

    move-result v3

    const/4 v6, 0x2

    if-le v3, v6, :cond_d

    const/4 v3, 0x1

    goto :goto_7

    :cond_b
    move v3, v6

    goto :goto_7

    :cond_c
    move-object/from16 v24, v6

    :cond_d
    const/4 v3, 0x0

    .line 240
    :goto_7
    const-class v6, Lcom/flyersoft/staticlayout/MyMarginSpan;

    invoke-interface {v9, v13, v15, v6}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Lcom/flyersoft/staticlayout/MyMarginSpan;

    move/from16 v25, v3

    const/4 v3, 0x0

    .line 243
    :goto_8
    array-length v4, v6

    if-ge v3, v4, :cond_11

    .line 244
    aget-object v4, v6, v3

    instance-of v4, v4, Lcom/flyersoft/staticlayout/MyFloatSpan;

    if-eqz v4, :cond_10

    .line 245
    iget-object v4, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->floatSp:Lcom/flyersoft/staticlayout/MyFloatSpan;

    move/from16 v27, v3

    if-eqz v4, :cond_f

    iget v3, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->float_width:F

    const/16 v17, 0x0

    cmpl-float v3, v3, v17

    if-lez v3, :cond_f

    .line 246
    iget v3, v4, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_v:F

    iget-object v4, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->floatSp:Lcom/flyersoft/staticlayout/MyFloatSpan;

    iget v4, v4, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_height:F

    add-float/2addr v3, v4

    int-to-float v4, v7

    cmpg-float v28, v4, v3

    if-gez v28, :cond_e

    int-to-float v7, v8

    sub-float v4, v3, v4

    add-float/2addr v7, v4

    float-to-int v8, v7

    float-to-int v7, v3

    :cond_e
    const/4 v3, 0x0

    .line 251
    iput v3, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->float_width:F

    .line 253
    :cond_f
    aget-object v3, v6, v27

    check-cast v3, Lcom/flyersoft/staticlayout/MyFloatSpan;

    iput-object v3, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->floatSp:Lcom/flyersoft/staticlayout/MyFloatSpan;

    goto :goto_9

    :cond_10
    move/from16 v27, v3

    add-int/lit8 v3, v27, 0x1

    goto :goto_8

    :cond_11
    :goto_9
    move-object/from16 v40, v0

    move-object/from16 v39, v10

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v10, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v37, 0x0

    const/16 v38, -0x1

    .line 260
    :goto_a
    array-length v0, v6

    if-ge v3, v0, :cond_1a

    .line 261
    aget-object v0, v6, v3

    move/from16 v41, v3

    .line 262
    iget v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->leftMargin:F

    add-float v30, v30, v3

    .line 263
    iget v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->rightMargin:F

    add-float v37, v37, v3

    .line 265
    iget v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->indent:F

    const/16 v17, 0x0

    cmpl-float v3, v3, v17

    if-eqz v3, :cond_13

    if-eqz v10, :cond_12

    .line 266
    iget v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->spStart:I

    move-object/from16 v42, v6

    iget v6, v10, Lcom/flyersoft/staticlayout/MyMarginSpan;->spStart:I

    if-le v3, v6, :cond_14

    goto :goto_b

    :cond_12
    move-object/from16 v42, v6

    .line 268
    :goto_b
    iget v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->indent:F

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM2()F

    move-result v6

    mul-float v3, v3, v6

    float-to-int v3, v3

    move-object v10, v0

    move/from16 v27, v3

    goto :goto_c

    :cond_13
    move-object/from16 v42, v6

    .line 271
    :cond_14
    :goto_c
    iget v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->topMargin:F

    const/16 v17, 0x0

    cmpl-float v3, v3, v17

    if-eqz v3, :cond_16

    .line 272
    iget v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->spStart:I

    if-ne v3, v13, :cond_15

    int-to-float v3, v7

    .line 273
    iget v6, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->topMargin:F

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v7

    mul-float v6, v6, v7

    add-float/2addr v3, v6

    float-to-int v3, v3

    move v7, v3

    goto :goto_d

    .line 274
    :cond_15
    iget v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->spStart:I

    add-int/lit8 v6, v13, 0x1

    if-ne v3, v6, :cond_16

    invoke-interface {v2, v13}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    const v6, 0xfffc

    if-ne v3, v6, :cond_16

    .line 275
    iget v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->topMargin:F

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v6

    mul-float v3, v3, v6

    add-float v29, v29, v3

    .line 278
    :cond_16
    :goto_d
    iget v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->bottomMargin:F

    const/16 v17, 0x0

    cmpl-float v3, v3, v17

    if-lez v3, :cond_17

    iget v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->spEnd:I

    if-ne v3, v15, :cond_17

    int-to-float v3, v4

    .line 279
    iget v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->bottomMargin:F

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v6

    mul-float v4, v4, v6

    add-float/2addr v3, v4

    float-to-int v3, v3

    .line 280
    iget v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->spEnd:I

    move/from16 v38, v4

    move v4, v3

    .line 282
    :cond_17
    iget-boolean v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->noindent:Z

    if-nez v3, :cond_18

    instance-of v0, v0, Lcom/flyersoft/staticlayout/MyBulletSpan;

    if-eqz v0, :cond_19

    :cond_18
    const/16 v28, 0x1

    :cond_19
    add-int/lit8 v3, v41, 0x1

    move-object/from16 v6, v42

    goto/16 :goto_a

    :cond_1a
    int-to-float v0, v7

    add-float v0, v0, v29

    float-to-int v0, v0

    .line 287
    iget v3, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineCount:I

    invoke-virtual {v1, v3}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->getLineTop(I)I

    move-result v3

    if-le v0, v3, :cond_1b

    .line 288
    iget v3, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineCount:I

    invoke-virtual {v1, v3}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->getLineTop(I)I

    move-result v6

    sub-int v6, v0, v6

    invoke-virtual {v1, v3, v6}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->setLineTopAdded(II)V

    if-lez v8, :cond_1b

    .line 290
    iget v3, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineCount:I

    invoke-virtual {v1, v3, v8}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->setLineTopAdded2(II)V

    .line 294
    :cond_1b
    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v3

    mul-float v30, v30, v3

    .line 295
    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v3

    mul-float v3, v3, v37

    .line 298
    iget-object v6, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->floatSp:Lcom/flyersoft/staticlayout/MyFloatSpan;

    if-eqz v6, :cond_20

    .line 299
    iget v6, v6, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_width:F

    .line 300
    iget-object v7, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->floatSp:Lcom/flyersoft/staticlayout/MyFloatSpan;

    iget-boolean v7, v7, Lcom/flyersoft/staticlayout/MyFloatSpan;->isLeft:Z

    if-eqz v7, :cond_1d

    cmpg-float v7, v30, v6

    if-gez v7, :cond_1c

    sub-float v6, v6, v30

    .line 302
    iput v6, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->float_width:F

    goto :goto_e

    .line 304
    :cond_1c
    invoke-static/range {v36 .. v36}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v6

    iput v6, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->float_width:F

    goto :goto_e

    :cond_1d
    cmpg-float v7, v3, v6

    if-gez v7, :cond_1e

    sub-float/2addr v6, v3

    .line 307
    iput v6, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->float_width:F

    goto :goto_e

    .line 309
    :cond_1e
    invoke-static/range {v36 .. v36}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v6

    iput v6, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->float_width:F

    .line 311
    :goto_e
    iget-object v6, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->floatSp:Lcom/flyersoft/staticlayout/MyFloatSpan;

    iget v6, v6, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_v:F

    const/16 v17, 0x0

    cmpl-float v6, v6, v17

    if-lez v6, :cond_20

    invoke-interface {v2, v13}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v6

    const v7, 0xfffc

    if-ne v6, v7, :cond_20

    sub-int v6, v15, v13

    const/4 v7, 0x1

    if-eq v6, v7, :cond_1f

    const/4 v7, 0x2

    if-ne v6, v7, :cond_20

    add-int/lit8 v6, v13, 0x1

    .line 312
    invoke-interface {v2, v6}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v6

    const/16 v7, 0xa

    if-ne v6, v7, :cond_20

    .line 313
    :cond_1f
    iget-object v6, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->floatSp:Lcom/flyersoft/staticlayout/MyFloatSpan;

    iget v6, v6, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_v:F

    iget-object v7, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->floatSp:Lcom/flyersoft/staticlayout/MyFloatSpan;

    iget v7, v7, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_height:F

    add-float/2addr v6, v7

    float-to-int v6, v6

    if-ge v0, v6, :cond_20

    .line 316
    iget v0, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineCount:I

    invoke-virtual {v1, v0}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->getLineTop(I)I

    move-result v7

    sub-int v7, v6, v7

    invoke-virtual {v1, v0, v7}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->setLineTopAdded(II)V

    move v7, v6

    goto :goto_f

    :cond_20
    move v7, v0

    :goto_f
    sub-float v0, v26, v32

    cmpl-float v6, v30, v0

    if-lez v6, :cond_21

    move/from16 v30, v0

    :cond_21
    add-float v0, v30, v3

    sub-float v0, v26, v0

    float-to-int v0, v0

    if-le v0, v12, :cond_22

    move v0, v12

    :cond_22
    const/high16 v6, 0x40400000    # 3.0f

    mul-float v6, v6, v32

    const/high16 v8, 0x40800000    # 4.0f

    div-float/2addr v6, v8

    float-to-int v6, v6

    if-ge v0, v6, :cond_23

    move v0, v6

    :cond_23
    sub-int v6, v0, v27

    .line 331
    const-class v8, Landroid/text/style/LineHeightSpan;

    invoke-interface {v9, v13, v15, v8}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Landroid/text/style/LineHeightSpan;

    .line 333
    array-length v10, v8

    if-eqz v10, :cond_27

    if-eqz v5, :cond_24

    .line 334
    array-length v10, v5

    move/from16 v27, v0

    array-length v0, v8

    if-ge v10, v0, :cond_25

    goto :goto_10

    :cond_24
    move/from16 v27, v0

    .line 336
    :goto_10
    array-length v0, v8

    invoke-static {v0}, Lcom/flyersoft/staticlayout/ArrayUtils;->idealIntArraySize(I)I

    move-result v0

    new-array v5, v0, [I

    :cond_25
    const/4 v0, 0x0

    .line 340
    :goto_11
    array-length v10, v8

    if-ge v0, v10, :cond_28

    .line 341
    aget-object v10, v8, v0

    invoke-interface {v9, v10}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v10

    if-ge v10, v13, :cond_26

    .line 344
    invoke-virtual {v1, v10}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->getLineForOffset(I)I

    move-result v10

    invoke-virtual {v1, v10}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->getLineTop(I)I

    move-result v10

    aput v10, v5, v0

    goto :goto_12

    .line 346
    :cond_26
    aput v7, v5, v0

    :goto_12
    add-int/lit8 v0, v0, 0x1

    goto :goto_11

    :cond_27
    move/from16 v27, v0

    :cond_28
    move/from16 v0, v38

    move/from16 v38, v4

    move v4, v0

    move/from16 v42, v3

    move-object v3, v5

    move/from16 v37, v25

    move/from16 v0, v27

    move/from16 v43, v29

    move/from16 v41, v30

    move-object/from16 v25, v8

    goto :goto_13

    :cond_29
    move-object/from16 v40, v0

    move-object/from16 v24, v6

    move-object/from16 v39, v10

    move-object v3, v5

    move v0, v12

    move v6, v0

    move/from16 v4, v25

    const/16 v25, 0x0

    const/16 v28, 0x0

    const/16 v37, 0x0

    const/16 v38, 0x0

    const/16 v41, 0x0

    const/16 v42, 0x0

    const/16 v43, 0x0

    .line 352
    :goto_13
    sget-boolean v5, Lcom/flyersoft/tools/A;->indentParagraph:Z

    if-eqz v5, :cond_2a

    if-nez v28, :cond_2a

    .line 353
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->getTv()Lcom/flyersoft/staticlayout/MRTextView;

    move-result-object v5

    invoke-virtual {v5}, Lcom/flyersoft/staticlayout/MRTextView;->indentWidth()F

    move-result v5

    float-to-int v5, v5

    sub-int/2addr v6, v5

    :cond_2a
    sub-int v5, v15, v13

    .line 355
    array-length v8, v14

    if-le v5, v8, :cond_2b

    .line 357
    invoke-static {v5}, Lcom/flyersoft/staticlayout/ArrayUtils;->idealByteArraySize(I)I

    move-result v8

    new-array v14, v8, [B

    .line 359
    iput-object v14, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mChdirs:[B

    .line 361
    :cond_2b
    array-length v8, v11

    if-le v5, v8, :cond_2c

    .line 362
    invoke-static {v5}, Lcom/flyersoft/staticlayout/ArrayUtils;->idealCharArraySize(I)I

    move-result v8

    new-array v8, v8, [C

    .line 364
    iput-object v8, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mChs:[C

    move-object v11, v8

    :cond_2c
    mul-int/lit8 v8, v5, 0x2

    move-object/from16 v10, v40

    move/from16 v40, v0

    .line 366
    array-length v0, v10

    if-le v8, v0, :cond_2d

    .line 367
    invoke-static {v8}, Lcom/flyersoft/staticlayout/ArrayUtils;->idealIntArraySize(I)I

    move-result v0

    new-array v0, v0, [F

    .line 369
    iput-object v0, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mWidths:[F

    goto :goto_14

    :cond_2d
    move-object v0, v10

    :goto_14
    const/4 v8, 0x0

    .line 372
    invoke-static {v2, v13, v15, v11, v8}, Lcom/flyersoft/staticlayout/TextUtils;->getChars(Ljava/lang/CharSequence;II[CI)V

    const/4 v8, 0x0

    :goto_15
    if-ge v8, v5, :cond_2f

    .line 381
    aget-char v10, v11, v8

    move-object/from16 v27, v3

    const/16 v3, 0x590

    if-lt v10, v3, :cond_2e

    const/16 v3, 0x6ff

    if-gt v10, v3, :cond_2e

    const/16 v20, 0x0

    goto :goto_16

    :cond_2e
    add-int/lit8 v8, v8, 0x1

    move-object/from16 v3, v27

    goto :goto_15

    :cond_2f
    move-object/from16 v27, v3

    const/16 v20, 0x1

    :goto_16
    const/16 v3, 0xc

    if-nez v20, :cond_63

    .line 388
    invoke-static {v11, v14, v5}, Landroid/text/AndroidCharacter;->getDirectionalities([C[BI)V

    move v3, v13

    :goto_17
    if-ge v3, v15, :cond_32

    sub-int v44, v3, v13

    .line 392
    aget-byte v8, v14, v44

    if-nez v8, :cond_30

    const/4 v3, 0x1

    const/4 v10, 0x1

    goto :goto_18

    :cond_30
    const/4 v10, 0x1

    if-ne v8, v10, :cond_31

    const/4 v3, -0x1

    goto :goto_18

    :cond_31
    add-int/lit8 v3, v3, 0x1

    goto :goto_17

    :cond_32
    const/4 v10, 0x1

    const/4 v3, 0x1

    :goto_18
    if-ne v3, v10, :cond_33

    const/4 v8, 0x0

    goto :goto_19

    :cond_33
    const/4 v8, 0x1

    :goto_19
    const/4 v10, 0x0

    :goto_1a
    if-ge v10, v5, :cond_36

    move/from16 v46, v3

    .line 411
    aget-byte v3, v14, v10

    move/from16 v47, v4

    const/4 v4, 0x6

    if-ne v3, v4, :cond_35

    if-nez v10, :cond_34

    .line 413
    aput-byte v8, v14, v10

    goto :goto_1b

    :cond_34
    add-int/lit8 v3, v10, -0x1

    .line 415
    aget-byte v3, v14, v3

    aput-byte v3, v14, v10

    :cond_35
    :goto_1b
    add-int/lit8 v10, v10, 0x1

    move/from16 v3, v46

    move/from16 v4, v47

    goto :goto_1a

    :cond_36
    move/from16 v46, v3

    move/from16 v47, v4

    move v4, v8

    const/4 v3, 0x0

    :goto_1c
    if-ge v3, v5, :cond_3a

    .line 422
    aget-byte v10, v14, v3

    move/from16 v48, v3

    if-eqz v10, :cond_38

    const/4 v3, 0x1

    if-eq v10, v3, :cond_38

    const/4 v3, 0x2

    if-ne v10, v3, :cond_37

    goto :goto_1d

    :cond_37
    move/from16 v49, v7

    const/4 v7, 0x3

    if-ne v10, v7, :cond_39

    if-ne v4, v3, :cond_39

    const/16 v44, 0x6

    .line 430
    aput-byte v44, v14, v48

    goto :goto_1e

    :cond_38
    :goto_1d
    move/from16 v49, v7

    move v4, v10

    :cond_39
    :goto_1e
    add-int/lit8 v3, v48, 0x1

    move/from16 v7, v49

    goto :goto_1c

    :cond_3a
    move/from16 v49, v7

    const/4 v3, 0x0

    :goto_1f
    if-ge v3, v5, :cond_3c

    .line 436
    aget-byte v4, v14, v3

    const/4 v7, 0x2

    if-ne v4, v7, :cond_3b

    const/4 v10, 0x1

    .line 437
    aput-byte v10, v14, v3

    const/16 v46, -0x1

    :cond_3b
    add-int/lit8 v3, v3, 0x1

    goto :goto_1f

    :cond_3c
    const/4 v3, 0x1

    :goto_20
    const/4 v7, 0x2

    add-int/lit8 v4, v5, -0x1

    const/4 v10, 0x4

    if-ge v3, v4, :cond_40

    .line 444
    aget-byte v4, v14, v3

    add-int/lit8 v18, v3, -0x1

    .line 445
    aget-byte v7, v14, v18

    add-int/lit8 v18, v3, 0x1

    move/from16 v50, v3

    .line 446
    aget-byte v3, v14, v18

    if-ne v4, v10, :cond_3d

    const/4 v10, 0x3

    if-ne v7, v10, :cond_3f

    if-ne v3, v10, :cond_3f

    .line 451
    aput-byte v10, v14, v50

    goto :goto_21

    :cond_3d
    const/4 v10, 0x3

    const/4 v1, 0x7

    if-ne v4, v1, :cond_3f

    if-ne v7, v10, :cond_3e

    if-ne v3, v10, :cond_3e

    .line 455
    aput-byte v10, v14, v50

    :cond_3e
    const/4 v4, 0x6

    if-ne v7, v4, :cond_3f

    if-ne v3, v4, :cond_3f

    .line 458
    aput-byte v4, v14, v50

    :cond_3f
    :goto_21
    move-object/from16 v1, p0

    move/from16 v3, v18

    goto :goto_20

    :cond_40
    const/4 v1, 0x0

    const/4 v3, 0x0

    :goto_22
    if-ge v1, v5, :cond_43

    .line 465
    aget-byte v7, v14, v1

    const/4 v10, 0x3

    if-ne v7, v10, :cond_41

    const/4 v3, 0x1

    const/16 v45, 0x3

    goto :goto_23

    :cond_41
    const/4 v10, 0x5

    const/16 v45, 0x3

    if-ne v7, v10, :cond_42

    if-eqz v3, :cond_42

    .line 470
    aput-byte v45, v14, v1

    goto :goto_23

    :cond_42
    const/4 v3, 0x0

    :goto_23
    add-int/lit8 v1, v1, 0x1

    const/4 v10, 0x4

    goto :goto_22

    :cond_43
    const/4 v1, 0x0

    :goto_24
    const/16 v45, 0x3

    if-ltz v4, :cond_49

    .line 479
    aget-byte v3, v14, v4

    const/4 v10, 0x3

    if-ne v3, v10, :cond_44

    const/4 v1, 0x4

    const/4 v3, 0x1

    const/4 v7, 0x5

    goto :goto_26

    :cond_44
    const/4 v7, 0x5

    if-ne v3, v7, :cond_46

    if-eqz v1, :cond_45

    .line 485
    aput-byte v10, v14, v4

    goto :goto_25

    :cond_45
    const/16 v3, 0xd

    .line 487
    aput-byte v3, v14, v4

    :goto_25
    move v3, v1

    const/4 v1, 0x4

    goto :goto_26

    :cond_46
    const/4 v1, 0x4

    if-eq v3, v1, :cond_47

    const/4 v10, 0x7

    if-eq v3, v10, :cond_47

    const/16 v10, 0xa

    if-eq v3, v10, :cond_47

    const/16 v10, 0xb

    if-ne v3, v10, :cond_48

    :cond_47
    const/16 v3, 0xd

    .line 495
    aput-byte v3, v14, v4

    :cond_48
    const/4 v3, 0x0

    :goto_26
    add-int/lit8 v4, v4, -0x1

    move v1, v3

    goto :goto_24

    :cond_49
    const/4 v7, 0x5

    move v3, v8

    const/4 v1, 0x0

    :goto_27
    if-ge v1, v5, :cond_4d

    .line 502
    aget-byte v4, v14, v1

    if-eq v4, v8, :cond_4a

    if-eqz v4, :cond_4a

    const/4 v10, 0x1

    if-ne v4, v10, :cond_4b

    :cond_4a
    move v3, v4

    :cond_4b
    const/4 v10, 0x3

    if-ne v4, v10, :cond_4c

    .line 509
    aput-byte v3, v14, v1

    :cond_4c
    add-int/lit8 v1, v1, 0x1

    goto :goto_27

    :cond_4d
    move v3, v8

    const/4 v1, 0x0

    :goto_28
    if-ge v1, v5, :cond_58

    .line 515
    aget-byte v4, v14, v1

    if-eqz v4, :cond_57

    const/4 v10, 0x1

    if-ne v4, v10, :cond_4e

    goto :goto_2f

    :cond_4e
    const/4 v7, 0x3

    if-eq v4, v7, :cond_56

    const/4 v7, 0x6

    if-ne v4, v7, :cond_4f

    goto :goto_2e

    :cond_4f
    add-int/lit8 v4, v1, 0x1

    move v7, v4

    move v4, v8

    :goto_29
    if-ge v7, v5, :cond_53

    .line 526
    aget-byte v4, v14, v7

    if-eqz v4, :cond_53

    if-ne v4, v10, :cond_50

    goto :goto_2b

    :cond_50
    const/4 v10, 0x3

    if-eq v4, v10, :cond_52

    const/4 v10, 0x6

    if-ne v4, v10, :cond_51

    goto :goto_2a

    :cond_51
    add-int/lit8 v7, v7, 0x1

    const/4 v10, 0x1

    goto :goto_29

    :cond_52
    const/4 v10, 0x6

    :goto_2a
    const/4 v4, 0x1

    goto :goto_2c

    :cond_53
    :goto_2b
    const/4 v10, 0x6

    :goto_2c
    if-ge v1, v7, :cond_55

    if-ne v4, v3, :cond_54

    .line 539
    aput-byte v3, v14, v1

    goto :goto_2d

    .line 541
    :cond_54
    aput-byte v8, v14, v1

    :goto_2d
    add-int/lit8 v1, v1, 0x1

    goto :goto_2c

    :cond_55
    add-int/lit8 v1, v7, -0x1

    goto :goto_30

    :cond_56
    :goto_2e
    const/4 v10, 0x6

    const/4 v3, 0x1

    goto :goto_30

    :cond_57
    :goto_2f
    const/4 v10, 0x6

    move v3, v4

    :goto_30
    const/4 v7, 0x1

    add-int/2addr v1, v7

    const/4 v7, 0x5

    goto :goto_28

    :cond_58
    const/4 v10, 0x6

    const/4 v1, 0x0

    :goto_31
    if-ge v1, v5, :cond_5b

    .line 551
    aget-char v3, v11, v1

    const/16 v4, 0x9

    if-eq v3, v4, :cond_59

    const v7, 0xd800

    if-lt v3, v7, :cond_5a

    const v7, 0xdfff

    if-gt v3, v7, :cond_5a

    .line 553
    :cond_59
    aput-byte v8, v14, v1

    :cond_5a
    add-int/lit8 v1, v1, 0x1

    goto :goto_31

    :cond_5b
    const/16 v4, 0x9

    if-eqz v22, :cond_5e

    .line 560
    move-object v1, v2

    check-cast v1, Landroid/text/Spanned;

    .line 561
    const-class v3, Lcom/flyersoft/staticlayout/ReplacementSpan;

    invoke-interface {v1, v13, v15, v3}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lcom/flyersoft/staticlayout/ReplacementSpan;

    const/4 v7, 0x0

    .line 563
    :goto_32
    array-length v4, v3

    if-ge v7, v4, :cond_5e

    .line 564
    aget-object v4, v3, v7

    invoke-interface {v1, v4}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v4

    .line 565
    aget-object v10, v3, v7

    invoke-interface {v1, v10}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v10

    :goto_33
    if-ge v4, v10, :cond_5d

    move-object/from16 v18, v1

    sub-int v1, v4, v13

    move-object/from16 v50, v3

    if-ltz v1, :cond_5c

    .line 568
    array-length v3, v14

    if-ge v1, v3, :cond_5c

    array-length v3, v11

    if-ge v1, v3, :cond_5c

    .line 569
    aput-byte v8, v14, v1

    const v23, 0xfffc

    .line 570
    aput-char v23, v11, v1

    goto :goto_34

    :cond_5c
    const v23, 0xfffc

    :goto_34
    add-int/lit8 v4, v4, 0x1

    move-object/from16 v1, v18

    move-object/from16 v3, v50

    goto :goto_33

    :cond_5d
    move-object/from16 v18, v1

    move-object/from16 v50, v3

    const v23, 0xfffc

    add-int/lit8 v7, v7, 0x1

    const/4 v10, 0x6

    goto :goto_32

    :cond_5e
    const/4 v1, 0x0

    const/4 v3, 0x0

    :goto_35
    if-ge v1, v5, :cond_64

    .line 578
    aget-byte v4, v14, v1

    const/4 v10, 0x1

    if-ne v4, v10, :cond_62

    move v4, v1

    :goto_36
    if-ge v4, v5, :cond_60

    .line 581
    aget-byte v7, v14, v4

    if-eq v7, v10, :cond_5f

    goto :goto_37

    :cond_5f
    add-int/lit8 v4, v4, 0x1

    const/4 v10, 0x1

    goto :goto_36

    :cond_60
    :goto_37
    sub-int v7, v4, v1

    .line 584
    invoke-static {v11, v1, v7}, Landroid/text/AndroidCharacter;->mirror([CII)Z

    move-result v1

    if-eqz v1, :cond_61

    const/4 v3, 0x1

    :cond_61
    add-int/lit8 v1, v4, -0x1

    const/4 v10, 0x1

    :cond_62
    add-int/2addr v1, v10

    goto :goto_35

    :cond_63
    move/from16 v47, v4

    move/from16 v49, v7

    const/4 v3, 0x0

    const/16 v46, 0x1

    :cond_64
    if-eqz v3, :cond_66

    if-nez v39, :cond_65

    .line 595
    invoke-static {v2, v11, v13, v15}, Lcom/flyersoft/staticlayout/AlteredCharSequence;->make(Ljava/lang/CharSequence;[CII)Lcom/flyersoft/staticlayout/AlteredCharSequence;

    move-result-object v10

    goto :goto_38

    :cond_65
    move-object/from16 v1, v39

    .line 597
    invoke-virtual {v1, v11, v13, v15}, Lcom/flyersoft/staticlayout/AlteredCharSequence;->update([CII)V

    move-object v10, v1

    :goto_38
    move-object v1, v10

    move-object/from16 v39, v1

    goto :goto_39

    :cond_66
    move-object/from16 v1, v39

    move-object v1, v2

    :goto_39
    if-le v6, v12, :cond_67

    move v6, v12

    :cond_67
    move v3, v6

    move v6, v13

    move v7, v6

    move/from16 v59, v7

    move/from16 v60, v59

    move/from16 v4, v49

    const/16 v18, 0x0

    const/16 v23, 0x0

    const/16 v29, 0x0

    const/16 v49, 0x0

    const/16 v50, 0x0

    const/16 v51, 0x0

    const/16 v52, 0x0

    const/16 v53, 0x0

    const/16 v54, 0x0

    const/16 v55, 0x0

    const/16 v56, 0x0

    const/16 v57, 0x0

    const/16 v58, 0x0

    :goto_3a
    const/4 v10, 0x5

    if-ge v7, v15, :cond_108

    if-nez v9, :cond_68

    move v8, v15

    goto :goto_3b

    .line 628
    :cond_68
    const-class v8, Landroid/text/style/MetricAffectingSpan;

    invoke-interface {v9, v7, v15, v8}, Landroid/text/Spanned;->nextSpanTransition(IILjava/lang/Class;)I

    move-result v8

    :goto_3b
    if-nez v9, :cond_69

    move-object/from16 v10, p4

    .line 631
    invoke-virtual {v10, v1, v7, v8, v0}, Landroid/text/TextPaint;->getTextWidths(Ljava/lang/CharSequence;II[F)I

    sub-int v62, v7, v13

    add-int v2, v5, v62

    move/from16 v62, v3

    sub-int v3, v8, v7

    move/from16 v63, v5

    const/4 v5, 0x0

    .line 632
    invoke-static {v0, v5, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object/from16 v2, v24

    .line 633
    invoke-virtual {v10, v2}, Landroid/text/TextPaint;->getFontMetricsInt(Landroid/graphics/Paint$FontMetricsInt;)I

    move-object/from16 v3, p0

    move/from16 v28, v6

    move-object/from16 v45, v9

    move/from16 v64, v47

    move-object v9, v0

    move-object v6, v2

    move v2, v4

    const/4 v0, 0x5

    goto/16 :goto_3f

    :cond_69
    move-object/from16 v10, p4

    move/from16 v62, v3

    move/from16 v63, v5

    move-object/from16 v2, v24

    const/4 v5, 0x0

    move-object/from16 v3, p0

    move-object/from16 v24, v0

    .line 636
    iget-object v0, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mWorkPaint:Landroid/text/TextPaint;

    iput v5, v0, Landroid/text/TextPaint;->baselineShift:I

    .line 638
    iget-object v0, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->floatSp:Lcom/flyersoft/staticlayout/MyFloatSpan;

    if-eqz v0, :cond_6d

    iget v0, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->spStart:I

    if-ne v0, v7, :cond_6d

    iget-object v0, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->floatSp:Lcom/flyersoft/staticlayout/MyFloatSpan;

    iget v0, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->spEnd:I

    if-ne v0, v8, :cond_6d

    .line 639
    iget-object v0, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->floatSp:Lcom/flyersoft/staticlayout/MyFloatSpan;

    iget v0, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_width:F

    .line 640
    iget-object v5, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->floatSp:Lcom/flyersoft/staticlayout/MyFloatSpan;

    iget-boolean v5, v5, Lcom/flyersoft/staticlayout/MyFloatSpan;->isLeft:Z

    if-eqz v5, :cond_6b

    cmpg-float v5, v41, v0

    if-gez v5, :cond_6a

    sub-float v0, v0, v41

    .line 642
    iput v0, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->float_width:F

    goto :goto_3c

    .line 644
    :cond_6a
    invoke-static/range {v36 .. v36}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v0

    iput v0, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->float_width:F

    goto :goto_3c

    :cond_6b
    cmpg-float v5, v42, v0

    if-gez v5, :cond_6c

    sub-float v0, v0, v42

    .line 647
    iput v0, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->float_width:F

    goto :goto_3c

    .line 649
    :cond_6c
    invoke-static/range {v36 .. v36}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v0

    iput v0, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->float_width:F

    .line 651
    :goto_3c
    iget-object v0, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->floatSp:Lcom/flyersoft/staticlayout/MyFloatSpan;

    int-to-float v5, v4

    sub-float v5, v5, v43

    iput v5, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_v:F

    :cond_6d
    if-lez v7, :cond_6e

    .line 654
    invoke-interface {v9}, Landroid/text/Spanned;->length()I

    move-result v0

    if-ge v7, v0, :cond_6e

    sub-int v0, v8, v7

    const/4 v5, 0x1

    if-ne v0, v5, :cond_6e

    invoke-interface {v9, v7}, Landroid/text/Spanned;->charAt(I)C

    move-result v0

    const/16 v5, 0xa

    if-ne v0, v5, :cond_6e

    const/4 v0, 0x1

    goto :goto_3d

    :cond_6e
    const/4 v0, 0x0

    :goto_3d
    if-eqz v0, :cond_6f

    .line 656
    iget v5, v2, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    iput v5, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->ascentTmp:I

    .line 657
    iget v5, v2, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    iput v5, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->descentTmp:I

    .line 658
    iget v5, v2, Landroid/graphics/Paint$FontMetricsInt;->top:I

    iput v5, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->topTmp:I

    .line 659
    iget v5, v2, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    iput v5, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->bottomTmp:I

    .line 662
    :cond_6f
    iget-object v5, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mWorkPaint:Landroid/text/TextPaint;

    move-object/from16 v28, v10

    move-object v10, v2

    move v2, v4

    move-object/from16 v4, v28

    move/from16 v28, v6

    move-object v6, v9

    move-object/from16 v9, v24

    move/from16 v64, v47

    move/from16 v24, v0

    const/4 v0, 0x5

    invoke-static/range {v4 .. v10}, Lcom/flyersoft/staticlayout/Styled;->getTextWidths(Landroid/text/TextPaint;Landroid/text/TextPaint;Landroid/text/Spanned;II[FLandroid/graphics/Paint$FontMetricsInt;)I

    move-object/from16 v45, v6

    move-object v6, v10

    const/16 v17, 0x0

    .line 663
    sput v17, Lcom/flyersoft/staticlayout/Styled;->rightMargin:F

    sput v17, Lcom/flyersoft/staticlayout/Styled;->leftMargin:F

    sub-int v4, v7, v13

    add-int v5, v63, v4

    sub-int v4, v8, v7

    const/4 v10, 0x0

    .line 665
    invoke-static {v9, v10, v9, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 667
    iget-object v4, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mWorkPaint:Landroid/text/TextPaint;

    iget v4, v4, Landroid/text/TextPaint;->baselineShift:I

    if-gez v4, :cond_70

    .line 668
    iget v4, v6, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    iget-object v5, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mWorkPaint:Landroid/text/TextPaint;

    iget v5, v5, Landroid/text/TextPaint;->baselineShift:I

    add-int/2addr v4, v5

    iput v4, v6, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    .line 669
    iget v4, v6, Landroid/graphics/Paint$FontMetricsInt;->top:I

    iget-object v5, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mWorkPaint:Landroid/text/TextPaint;

    iget v5, v5, Landroid/text/TextPaint;->baselineShift:I

    add-int/2addr v4, v5

    iput v4, v6, Landroid/graphics/Paint$FontMetricsInt;->top:I

    goto :goto_3e

    .line 671
    :cond_70
    iget v4, v6, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    iget-object v5, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mWorkPaint:Landroid/text/TextPaint;

    iget v5, v5, Landroid/text/TextPaint;->baselineShift:I

    add-int/2addr v4, v5

    iput v4, v6, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 672
    iget v4, v6, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    iget-object v5, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mWorkPaint:Landroid/text/TextPaint;

    iget v5, v5, Landroid/text/TextPaint;->baselineShift:I

    add-int/2addr v4, v5

    iput v4, v6, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    :goto_3e
    if-eqz v24, :cond_71

    if-nez v31, :cond_71

    .line 676
    iget v4, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->ascentTmp:I

    iput v4, v6, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    .line 677
    iget v4, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->descentTmp:I

    iput v4, v6, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 678
    iget v4, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->topTmp:I

    iput v4, v6, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 679
    iget v4, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->bottomTmp:I

    iput v4, v6, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    :cond_71
    if-nez v52, :cond_72

    .line 683
    invoke-virtual {v3}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->getTv()Lcom/flyersoft/staticlayout/MRTextView;

    move-result-object v4

    iget-object v5, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mWorkPaint:Landroid/text/TextPaint;

    invoke-virtual {v4, v5}, Lcom/flyersoft/staticlayout/MRTextView;->isItalicPaint(Landroid/text/TextPaint;)Z

    move-result v4

    if-eqz v4, :cond_73

    .line 684
    const-string v4, "A"

    iget-object v5, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mWorkPaint:Landroid/text/TextPaint;

    invoke-static {v4, v5}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v4

    const/high16 v5, 0x3f000000    # 0.5f

    mul-float v4, v4, v5

    float-to-int v4, v4

    goto :goto_40

    .line 685
    :cond_72
    invoke-virtual {v3}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->getTv()Lcom/flyersoft/staticlayout/MRTextView;

    move-result-object v4

    iget-object v5, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mWorkPaint:Landroid/text/TextPaint;

    invoke-virtual {v4, v5}, Lcom/flyersoft/staticlayout/MRTextView;->isItalicPaint(Landroid/text/TextPaint;)Z

    move-result v4

    if-nez v4, :cond_73

    const/4 v4, 0x0

    goto :goto_40

    :cond_73
    :goto_3f
    move/from16 v4, v52

    .line 689
    :goto_40
    sget v5, Lcom/flyersoft/tools/A;->fontSize:F

    invoke-static {v5}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v5

    mul-int/lit8 v5, v5, 0x5

    .line 690
    iget v10, v6, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    if-le v10, v5, :cond_74

    .line 691
    iput v5, v6, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    .line 692
    iget v10, v6, Landroid/graphics/Paint$FontMetricsInt;->top:I

    neg-int v5, v5

    if-ge v10, v5, :cond_74

    .line 693
    iput v5, v6, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 695
    :cond_74
    iget v5, v6, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 696
    iget v10, v6, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    .line 697
    iget v0, v6, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    move/from16 v24, v2

    .line 698
    iget v2, v6, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    move/from16 v47, v24

    move-object/from16 v24, v9

    move/from16 v9, v47

    move/from16 v47, v7

    move/from16 v48, v12

    move-object/from16 v52, v14

    move/from16 v14, v18

    move/from16 v18, v28

    move/from16 v67, v53

    move/from16 v68, v54

    move/from16 v69, v55

    move/from16 v70, v56

    move/from16 v71, v59

    move/from16 v72, v60

    move/from16 v54, v2

    move-object/from16 v28, v6

    move v12, v8

    move/from16 v53, v10

    move/from16 v6, v29

    move/from16 v10, v49

    move/from16 v2, v50

    move/from16 v29, v57

    move/from16 v8, v62

    :goto_41
    if-ge v7, v12, :cond_107

    move/from16 v49, v7

    .line 702
    iget v7, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->float_width:F

    move/from16 v50, v7

    const/4 v7, 0x0

    cmpl-float v17, v50, v7

    if-lez v17, :cond_75

    int-to-float v7, v9

    move/from16 v50, v7

    iget-object v7, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->floatSp:Lcom/flyersoft/staticlayout/MyFloatSpan;

    iget v7, v7, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_v:F

    move/from16 v55, v7

    iget-object v7, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->floatSp:Lcom/flyersoft/staticlayout/MyFloatSpan;

    iget v7, v7, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_height:F

    add-float v7, v55, v7

    cmpl-float v7, v50, v7

    if-ltz v7, :cond_75

    const/4 v7, 0x0

    .line 703
    iput v7, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->float_width:F

    const/4 v7, 0x0

    .line 704
    iput-object v7, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->floatSp:Lcom/flyersoft/staticlayout/MyFloatSpan;

    :cond_75
    sub-int v7, v49, v13

    move/from16 v50, v9

    .line 707
    aget-char v9, v11, v7

    move/from16 v55, v10

    const/16 v10, 0xa

    if-ne v9, v10, :cond_76

    move-object/from16 v56, v1

    :goto_42
    move/from16 v7, v51

    move/from16 v51, v6

    goto :goto_44

    :cond_76
    const/16 v10, 0x9

    if-ne v9, v10, :cond_77

    const/4 v10, 0x0

    .line 712
    invoke-static {v1, v13, v15, v6, v10}, Lcom/flyersoft/staticlayout/MyLayout;->nextTab(Ljava/lang/CharSequence;IIF[Ljava/lang/Object;)F

    move-result v6

    move-object/from16 v56, v1

    move/from16 v51, v6

    const/4 v7, 0x1

    goto :goto_44

    :cond_77
    const v10, 0xd800

    if-lt v9, v10, :cond_79

    const v10, 0xdfff

    if-gt v9, v10, :cond_79

    add-int/lit8 v10, v49, 0x1

    if-ge v10, v12, :cond_79

    .line 715
    invoke-static {v11, v7}, Ljava/lang/Character;->codePointAt([CI)I

    move-result v10

    move-object/from16 v56, v1

    .line 716
    sget v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->MIN_EMOJI:I

    if-lt v10, v1, :cond_78

    sget v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->MAX_EMOJI:I

    if-gt v10, v1, :cond_78

    add-int v7, v7, v63

    .line 717
    aget v1, v24, v7

    goto :goto_43

    :cond_78
    add-int v7, v7, v63

    .line 719
    aget v1, v24, v7

    goto :goto_43

    :cond_79
    move-object/from16 v56, v1

    add-int v7, v7, v63

    .line 722
    aget v1, v24, v7

    :goto_43
    add-float/2addr v6, v1

    goto :goto_42

    :goto_44
    int-to-float v1, v8

    .line 725
    iget v6, v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->float_width:F

    sub-float v6, v1, v6

    int-to-float v10, v4

    sub-float/2addr v6, v10

    move/from16 v57, v1

    cmpg-float v6, v51, v6

    if-gtz v6, :cond_9f

    add-int/lit8 v6, v49, 0x1

    if-ge v5, v14, :cond_7a

    move v14, v5

    :cond_7a
    if-ge v0, v2, :cond_7b

    move v2, v0

    :cond_7b
    move/from16 v10, v54

    move/from16 v1, v55

    if-le v10, v1, :cond_7c

    move v1, v10

    :cond_7c
    move/from16 v3, v53

    move/from16 v53, v4

    move/from16 v4, v23

    if-le v3, v4, :cond_7d

    move v4, v3

    .line 751
    :cond_7d
    sget-boolean v23, Lcom/flyersoft/tools/A;->textBreakOnlyAtSpaces:Z

    move/from16 v55, v3

    if-eqz v23, :cond_8c

    .line 752
    invoke-static {v9}, Lcom/flyersoft/tools/A;->isBlankChar(C)Z

    move-result v23

    if-nez v23, :cond_86

    const/16 v3, 0x9

    if-eq v9, v3, :cond_86

    const/16 v3, 0x3a

    if-eq v9, v3, :cond_80

    invoke-static {v9}, Lcom/flyersoft/tools/A;->isEnglishDot(C)Z

    move-result v3

    if-eqz v3, :cond_7e

    goto :goto_46

    :cond_7e
    move/from16 v73, v5

    move/from16 v5, v18

    :cond_7f
    :goto_45
    const/16 v3, 0x2f

    goto :goto_47

    :cond_80
    :goto_46
    add-int/lit8 v3, v49, -0x1

    move/from16 v73, v5

    move/from16 v5, v18

    if-lt v3, v5, :cond_81

    sub-int/2addr v3, v13

    aget-char v3, v11, v3

    .line 753
    invoke-static {v3}, Ljava/lang/Character;->isDigit(C)Z

    move-result v3

    if-nez v3, :cond_7f

    :cond_81
    if-ge v6, v12, :cond_87

    sub-int v3, v6, v13

    aget-char v18, v11, v3

    .line 754
    invoke-static/range {v18 .. v18}, Ljava/lang/Character;->isDigit(C)Z

    move-result v18

    if-nez v18, :cond_7f

    aget-char v18, v11, v3

    invoke-static/range {v18 .. v18}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isRightQuote(C)Z

    move-result v18

    if-nez v18, :cond_7f

    move/from16 v18, v3

    const/16 v3, 0x2e

    if-ne v9, v3, :cond_82

    aget-char v3, v11, v18

    .line 755
    invoke-static {v3}, Ljava/lang/Character;->isLetter(C)Z

    move-result v3

    if-eqz v3, :cond_82

    goto :goto_45

    :cond_82
    move/from16 v3, v69

    const/4 v9, 0x0

    goto :goto_4c

    :goto_47
    if-eq v9, v3, :cond_84

    .line 756
    invoke-static {v9}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isConnectChar(C)Z

    move-result v3

    if-eqz v3, :cond_83

    goto :goto_49

    :cond_83
    :goto_48
    const/16 v3, 0x2e80

    goto :goto_4a

    :cond_84
    :goto_49
    if-ge v6, v12, :cond_87

    sub-int v3, v6, v13

    aget-char v3, v11, v3

    invoke-static {v3}, Ljava/lang/Character;->isDigit(C)Z

    move-result v3

    if-eqz v3, :cond_87

    goto :goto_48

    :goto_4a
    if-lt v9, v3, :cond_85

    const/4 v3, 0x1

    .line 757
    invoke-static {v9, v3}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isIdeographic(CZ)Z

    move-result v9

    if-eqz v9, :cond_85

    if-ge v6, v12, :cond_85

    sub-int v3, v6, v13

    aget-char v3, v11, v3

    const/4 v9, 0x0

    invoke-static {v3, v9}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isIdeographic(CZ)Z

    move-result v3

    if-eqz v3, :cond_85

    goto :goto_4b

    :cond_85
    move/from16 p5, v7

    move/from16 v18, v8

    move/from16 v57, v10

    move/from16 v7, v67

    move/from16 v10, v68

    move/from16 v3, v69

    move/from16 v8, v70

    const/16 v67, 0x0

    goto/16 :goto_59

    :cond_86
    move/from16 v73, v5

    move/from16 v5, v18

    :cond_87
    const/4 v9, 0x0

    :goto_4b
    move/from16 v3, v69

    :goto_4c
    if-ge v14, v3, :cond_88

    move/from16 v69, v14

    goto :goto_4d

    :cond_88
    move/from16 v69, v3

    :goto_4d
    move/from16 v3, v67

    if-ge v2, v3, :cond_89

    move/from16 v67, v2

    goto :goto_4e

    :cond_89
    move/from16 v67, v3

    :goto_4e
    move/from16 v3, v68

    if-le v1, v3, :cond_8a

    move/from16 v68, v1

    goto :goto_4f

    :cond_8a
    move/from16 v68, v3

    :goto_4f
    move/from16 v18, v8

    move/from16 v8, v70

    move/from16 v23, v4

    if-le v4, v8, :cond_8b

    move/from16 v70, v23

    move/from16 v71, v6

    move/from16 v72, v71

    goto :goto_50

    :cond_8b
    move/from16 v71, v6

    move/from16 v72, v71

    move/from16 v70, v8

    :goto_50
    move/from16 v54, v10

    move/from16 v76, v12

    move v8, v13

    move v3, v14

    move/from16 v83, v15

    move-object/from16 v9, v24

    move-object/from16 v12, v25

    move-object/from16 v13, v27

    move-object/from16 v14, v28

    move/from16 v19, v46

    move/from16 v6, v51

    move/from16 v29, v6

    move/from16 v58, v29

    move/from16 v4, v67

    move/from16 v17, v68

    move/from16 v21, v69

    const/16 v44, 0x9

    const/16 v46, 0x0

    const/16 v61, 0x5

    const/16 v65, 0x6

    const/16 v66, 0x3

    const/16 v67, 0x0

    const/16 v80, 0xc

    move/from16 v68, v0

    move v10, v2

    move v15, v7

    move-object/from16 v69, v11

    move/from16 v7, v47

    move/from16 v11, v48

    move-object/from16 v2, v52

    move/from16 v52, v53

    move/from16 v53, v55

    const/4 v0, 0x1

    move/from16 v55, v1

    move/from16 v47, v22

    move/from16 v48, v26

    move/from16 v26, v63

    const/16 v63, 0x0

    goto/16 :goto_5b

    :cond_8c
    move/from16 v73, v5

    move/from16 p5, v7

    move/from16 v57, v10

    move/from16 v5, v18

    move/from16 v7, v67

    move/from16 v10, v68

    move/from16 v3, v69

    const/16 v67, 0x0

    move/from16 v18, v8

    move/from16 v8, v70

    .line 770
    invoke-static {}, Lcom/flyersoft/tools/A;->textCJK()Z

    move-result v58

    if-eqz v58, :cond_9e

    .line 772
    invoke-static {v9}, Lcom/flyersoft/tools/A;->isBlankChar(C)Z

    move-result v58

    move/from16 v68, v0

    if-nez v58, :cond_95

    const/16 v0, 0x9

    if-eq v9, v0, :cond_95

    sget-boolean v44, Lcom/flyersoft/tools/A;->textDense:Z

    if-eqz v44, :cond_8d

    sget-boolean v44, Lcom/flyersoft/tools/A;->textDensePunc:Z

    if-nez v44, :cond_95

    .line 774
    invoke-static {v9}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isLeftQuote(C)Z

    move-result v44

    if-eqz v44, :cond_95

    .line 775
    :cond_8d
    invoke-static {v9}, Lcom/flyersoft/tools/A;->isCnLineBreakDot(C)Z

    move-result v44

    if-nez v44, :cond_8f

    const/16 v0, 0x2026

    if-ne v9, v0, :cond_8e

    goto :goto_52

    :cond_8e
    :goto_51
    const/16 v0, 0x2f

    goto :goto_53

    :cond_8f
    :goto_52
    if-ge v6, v12, :cond_95

    sub-int v0, v6, v13

    aget-char v0, v11, v0

    .line 776
    invoke-static {v0}, Lcom/flyersoft/tools/A;->isCnLineBreakDot(C)Z

    move-result v0

    if-eqz v0, :cond_95

    goto :goto_51

    :goto_53
    if-eq v9, v0, :cond_90

    .line 780
    invoke-static {v9}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isConnectChar(C)Z

    move-result v0

    if-eqz v0, :cond_91

    :cond_90
    if-ge v6, v12, :cond_95

    sub-int v0, v6, v13

    aget-char v0, v11, v0

    .line 781
    invoke-static {v0}, Ljava/lang/Character;->isDigit(C)Z

    move-result v0

    if-eqz v0, :cond_95

    :cond_91
    if-ge v6, v12, :cond_92

    sub-int v0, v6, v13

    aget-char v0, v11, v0

    move-object/from16 v69, v11

    const/16 v11, 0x2e80

    if-lt v0, v11, :cond_93

    .line 784
    invoke-static {v0}, Lcom/flyersoft/tools/A;->isCnLineBreakDot(C)Z

    move-result v0

    if-nez v0, :cond_93

    invoke-static {v9}, Ljava/lang/Character;->getType(C)I

    move-result v0

    const/16 v11, 0x14

    if-lt v0, v11, :cond_96

    goto :goto_54

    :cond_92
    move-object/from16 v69, v11

    :goto_54
    const/16 v11, 0x2e80

    :cond_93
    const/4 v0, 0x1

    if-lt v9, v11, :cond_94

    .line 786
    invoke-static {v9, v0}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isIdeographic(CZ)Z

    move-result v11

    if-eqz v11, :cond_94

    if-ge v6, v12, :cond_97

    sub-int v11, v6, v13

    aget-char v11, v69, v11

    .line 787
    invoke-static {v11}, Lcom/flyersoft/tools/A;->isCnLineBreakDot(C)Z

    move-result v11

    if-nez v11, :cond_94

    goto :goto_55

    :cond_94
    const/4 v11, 0x0

    goto :goto_56

    :cond_95
    move-object/from16 v69, v11

    :cond_96
    const/4 v0, 0x1

    :cond_97
    :goto_55
    const/4 v11, 0x1

    :goto_56
    if-eqz v11, :cond_98

    .line 790
    invoke-static {v9}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isConnectChar(C)Z

    move-result v9

    if-eqz v9, :cond_98

    if-ge v6, v12, :cond_98

    sub-int v9, v6, v13

    aget-char v9, v69, v9

    invoke-static {v9}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isConnectChar(C)Z

    move-result v9

    if-eqz v9, :cond_98

    const/4 v11, 0x0

    :cond_98
    if-eqz v11, :cond_9d

    if-ge v14, v3, :cond_99

    move v3, v14

    :cond_99
    if-ge v2, v7, :cond_9a

    move v7, v2

    :cond_9a
    if-le v1, v10, :cond_9b

    move v10, v1

    :cond_9b
    if-le v4, v8, :cond_9c

    move/from16 v70, v4

    move/from16 v71, v6

    goto :goto_57

    :cond_9c
    move/from16 v71, v6

    move/from16 v70, v8

    :goto_57
    move/from16 v29, v51

    goto :goto_58

    :cond_9d
    move/from16 v70, v8

    :goto_58
    move/from16 v21, v3

    move/from16 v23, v4

    move/from16 v72, v6

    move v4, v7

    goto :goto_5a

    :cond_9e
    :goto_59
    move/from16 v68, v0

    move-object/from16 v69, v11

    const/4 v0, 0x1

    move/from16 v21, v3

    move/from16 v23, v4

    move/from16 v72, v6

    move v4, v7

    move/from16 v70, v8

    :goto_5a
    move/from16 v17, v10

    move/from16 v76, v12

    move v8, v13

    move v3, v14

    move/from16 v83, v15

    move-object/from16 v9, v24

    move-object/from16 v12, v25

    move-object/from16 v13, v27

    move-object/from16 v14, v28

    move/from16 v19, v46

    move/from16 v7, v47

    move/from16 v11, v48

    move/from16 v6, v51

    move/from16 v58, v6

    move/from16 v54, v57

    const/16 v44, 0x9

    const/16 v46, 0x0

    const/16 v61, 0x5

    const/16 v65, 0x6

    const/16 v66, 0x3

    const/16 v80, 0xc

    move/from16 v15, p5

    move v10, v2

    move/from16 v47, v22

    move/from16 v48, v26

    move-object/from16 v2, v52

    move/from16 v52, v53

    move/from16 v53, v55

    move/from16 v26, v63

    const/16 v63, 0x0

    move/from16 v55, v1

    :goto_5b
    move-object/from16 v1, p4

    goto/16 :goto_98

    :cond_9f
    move/from16 v73, v5

    move/from16 p5, v7

    move/from16 v5, v18

    move/from16 v6, v54

    move/from16 v1, v55

    move/from16 v7, v67

    move/from16 v3, v69

    const/16 v67, 0x0

    move/from16 v18, v8

    move-object/from16 v69, v11

    move/from16 v55, v53

    move/from16 v8, v70

    move/from16 v53, v4

    move v11, v10

    move/from16 v4, v23

    move/from16 v10, v68

    move/from16 v68, v0

    if-eqz p11, :cond_a7

    move/from16 v0, v71

    if-eq v0, v5, :cond_a2

    move/from16 v84, v4

    move v4, v0

    move/from16 v0, v84

    :goto_5c
    if-ge v4, v12, :cond_a0

    sub-int v9, v4, v13

    .line 810
    aget-char v9, v69, v9

    const/16 v11, 0x20

    if-ne v9, v11, :cond_a0

    add-int/lit8 v4, v4, 0x1

    goto :goto_5c

    :cond_a0
    move/from16 v9, p3

    if-ne v4, v9, :cond_a1

    const/16 v21, 0x1

    goto :goto_5d

    :cond_a1
    const/16 v21, 0x0

    :goto_5d
    move/from16 v23, v12

    move-object/from16 v12, v25

    const/4 v11, 0x0

    move/from16 v25, v13

    move v9, v7

    move v7, v3

    move v3, v5

    move v5, v9

    move-object/from16 v30, p4

    move/from16 v54, v6

    move v6, v10

    move/from16 v17, v13

    move/from16 v77, v15

    move/from16 v62, v18

    move/from16 v76, v23

    move-object/from16 v13, v27

    move/from16 v19, v46

    move/from16 v79, v47

    move/from16 v75, v48

    move/from16 v9, v50

    move-object/from16 v18, v52

    move/from16 v52, v53

    move/from16 v53, v55

    move-object/from16 v78, v69

    const/16 v46, 0x0

    move/from16 v15, p5

    move/from16 v10, p7

    move/from16 v23, p10

    move-object/from16 v27, p13

    move/from16 p5, v0

    move/from16 v55, v1

    move/from16 v50, v2

    move v0, v14

    move/from16 v47, v22

    move/from16 v48, v26

    move-object/from16 v14, v28

    move/from16 v26, v63

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v22, p9

    move/from16 v28, p12

    move-object/from16 v63, v11

    move/from16 v11, p8

    .line 814
    invoke-direct/range {v1 .. v30}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->out(Ljava/lang/CharSequence;IIIIIIIFF[Landroid/text/style/LineHeightSpan;[ILandroid/graphics/Paint$FontMetricsInt;ZZI[BIZZZZ[FIILcom/flyersoft/staticlayout/TextUtils$TruncateAt;FFLandroid/text/TextPaint;)I

    move-result v3

    move-object/from16 v1, p4

    move/from16 v23, p5

    move/from16 v71, v4

    move/from16 v21, v7

    move/from16 v70, v8

    move/from16 v8, v17

    move-object/from16 v2, v18

    move-object/from16 v9, v24

    move/from16 v10, v50

    move/from16 v18, v62

    move/from16 v11, v75

    move/from16 v83, v77

    move/from16 v7, v79

    const/16 v44, 0x9

    const/16 v61, 0x5

    const/16 v65, 0x6

    const/16 v66, 0x3

    const/16 v67, 0x0

    const/16 v80, 0xc

    move/from16 v50, v3

    move v4, v5

    move/from16 v17, v6

    move/from16 v6, v51

    move v3, v0

    move/from16 v5, v71

    const/4 v0, 0x1

    goto/16 :goto_98

    :cond_a2
    move/from16 v59, v0

    move v9, v4

    move v4, v5

    move v5, v7

    move/from16 v76, v12

    move/from16 v17, v13

    move v0, v14

    move/from16 v77, v15

    move/from16 v62, v18

    move-object/from16 v12, v25

    move-object/from16 v13, v27

    move-object/from16 v14, v28

    move/from16 v19, v46

    move/from16 v79, v47

    move/from16 v75, v48

    move-object/from16 v18, v52

    move/from16 v52, v53

    move/from16 v53, v55

    move-object/from16 v78, v69

    const/16 v46, 0x0

    move/from16 v15, p5

    move/from16 v55, v1

    move v7, v3

    move v3, v6

    move v6, v10

    move/from16 v47, v22

    move/from16 v48, v26

    move/from16 v26, v63

    move/from16 v1, v73

    const/16 v63, 0x0

    move v10, v2

    move-object/from16 v2, p1

    add-int/lit8 v11, v49, 0x1

    if-ge v1, v0, :cond_a3

    move/from16 p5, v1

    goto :goto_5e

    :cond_a3
    move/from16 p5, v0

    :goto_5e
    move/from16 v0, v68

    if-ge v0, v10, :cond_a4

    move v10, v0

    :cond_a4
    move/from16 v73, v1

    move/from16 v1, v55

    if-le v3, v1, :cond_a5

    move v1, v3

    :cond_a5
    move/from16 v68, v0

    move/from16 v0, v53

    move v2, v5

    move v5, v4

    move v4, v2

    if-le v0, v9, :cond_a6

    move/from16 v23, v0

    move/from16 v53, v23

    move/from16 v55, v1

    move/from16 v54, v3

    move/from16 v21, v7

    move/from16 v70, v8

    goto :goto_5f

    :cond_a6
    move/from16 v53, v0

    move/from16 v55, v1

    move/from16 v54, v3

    move/from16 v21, v7

    move/from16 v70, v8

    move/from16 v23, v9

    :goto_5f
    move/from16 v72, v11

    move/from16 v8, v17

    move-object/from16 v2, v18

    move-object/from16 v9, v24

    move/from16 v58, v51

    move/from16 v71, v59

    move/from16 v18, v62

    move/from16 v11, v75

    move/from16 v83, v77

    move-object/from16 v69, v78

    move/from16 v7, v79

    const/4 v0, 0x1

    const/16 v44, 0x9

    const/16 v61, 0x5

    const/16 v65, 0x6

    const/16 v66, 0x3

    const/16 v67, 0x0

    const/16 v80, 0xc

    move-object/from16 v1, p4

    move/from16 v3, p5

    move/from16 v17, v6

    move/from16 v6, v58

    goto/16 :goto_98

    :cond_a7
    move/from16 p6, v5

    move v5, v4

    move/from16 v4, p6

    move/from16 v21, v6

    move/from16 p6, v10

    move/from16 v76, v12

    move/from16 v17, v13

    move/from16 v77, v15

    move-object/from16 v12, v25

    move-object/from16 v13, v27

    move/from16 v19, v46

    move/from16 v79, v47

    move/from16 v75, v48

    move-object/from16 v18, v52

    move/from16 v52, v53

    move/from16 v0, v55

    move-object/from16 v78, v69

    move/from16 v6, v71

    const/16 v46, 0x0

    move/from16 v15, p5

    move v10, v2

    move/from16 p5, v7

    move/from16 v47, v22

    move/from16 v48, v26

    move/from16 v26, v63

    const/16 v63, 0x0

    move-object/from16 v2, p1

    move v7, v3

    move v3, v14

    move-object/from16 v14, v28

    .line 840
    invoke-direct/range {p0 .. p0}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isHyphenation()Z

    move-result v22

    if-eqz v22, :cond_a9

    if-eqz v37, :cond_a8

    goto :goto_60

    :cond_a8
    const/16 v65, 0x6

    const/16 v80, 0xc

    move/from16 v53, v0

    move-object v7, v2

    move/from16 p6, v11

    move/from16 v8, v17

    move/from16 v82, v21

    move/from16 p5, v50

    move/from16 v11, v72

    move/from16 v81, v73

    move/from16 v0, v76

    move-object/from16 v69, v78

    move-object/from16 v2, p0

    move/from16 v50, v29

    goto/16 :goto_6d

    :cond_a9
    :goto_60
    if-eq v6, v4, :cond_c0

    move/from16 v1, v76

    :goto_61
    if-ge v6, v1, :cond_aa

    sub-int v3, v6, v17

    move-object/from16 v69, v78

    .line 842
    aget-char v3, v69, v3

    const/16 v11, 0x20

    if-ne v3, v11, :cond_ab

    add-int/lit8 v6, v6, 0x1

    move-object/from16 v78, v69

    goto :goto_61

    :cond_aa
    move-object/from16 v69, v78

    .line 846
    :cond_ab
    invoke-static {}, Lcom/flyersoft/tools/A;->textCJK()Z

    move-result v3

    if-eqz v3, :cond_ba

    sget-boolean v3, Lcom/flyersoft/tools/A;->verticalAlignment:Z

    if-nez v3, :cond_ba

    .line 848
    sget-boolean v3, Lcom/flyersoft/tools/A;->textDense:Z

    if-nez v3, :cond_b7

    .line 850
    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-ge v6, v3, :cond_b2

    sub-int v3, v1, v4

    const/4 v5, 0x6

    if-le v3, v5, :cond_b3

    add-int/lit8 v3, v1, -0x2

    if-ne v6, v3, :cond_ac

    .line 851
    invoke-interface {v2, v6}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->getType(C)I

    move-result v3

    const/16 v11, 0x14

    if-ge v3, v11, :cond_ad

    goto :goto_62

    :cond_ac
    const/16 v11, 0x14

    :goto_62
    add-int/lit8 v3, v1, -0x3

    if-ne v6, v3, :cond_b3

    .line 852
    invoke-interface {v2, v6}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->getType(C)I

    move-result v3

    if-lt v3, v11, :cond_b3

    add-int/lit8 v3, v6, 0x1

    invoke-interface {v2, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->getType(C)I

    move-result v3

    if-lt v3, v11, :cond_b3

    :cond_ad
    add-int/lit8 v3, v6, -0x1

    :goto_63
    add-int/lit8 v9, v4, 0x3

    if-le v3, v9, :cond_b1

    .line 856
    invoke-interface {v2, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v9

    invoke-static {v9}, Ljava/lang/Character;->getType(C)I

    move-result v9

    const/4 v10, 0x5

    if-eq v9, v10, :cond_ae

    const/16 v10, 0xc

    if-eq v9, v10, :cond_af

    const/16 v11, 0x15

    if-eq v9, v11, :cond_af

    const/16 v11, 0x1d

    if-ne v9, v11, :cond_b0

    goto :goto_64

    :cond_ae
    const/16 v10, 0xc

    :cond_af
    :goto_64
    add-int/lit8 v9, v3, -0x1

    .line 858
    invoke-interface {v2, v9}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v9

    invoke-static {v9}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isLeftQuote(C)Z

    move-result v9

    if-nez v9, :cond_b0

    goto :goto_66

    :cond_b0
    add-int/lit8 v3, v3, -0x1

    goto :goto_63

    :cond_b1
    const/16 v10, 0xc

    goto :goto_67

    :cond_b2
    const/4 v5, 0x6

    :cond_b3
    const/16 v10, 0xc

    .line 863
    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-ge v6, v3, :cond_b6

    sub-int v3, v1, v4

    const/4 v9, 0x5

    if-le v3, v9, :cond_b6

    invoke-interface {v2, v6}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lcom/flyersoft/tools/A;->isCnLineBreakDot(C)Z

    move-result v3

    if-eqz v3, :cond_b6

    add-int/lit8 v3, v6, -0x1

    :goto_65
    add-int/lit8 v9, v4, 0x3

    if-le v3, v9, :cond_b6

    .line 865
    invoke-interface {v2, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v9

    invoke-static {v9}, Ljava/lang/Character;->getType(C)I

    move-result v9

    const/4 v11, 0x5

    if-eq v9, v11, :cond_b4

    if-eq v9, v10, :cond_b4

    const/16 v11, 0x15

    if-eq v9, v11, :cond_b4

    const/16 v11, 0x1d

    if-ne v9, v11, :cond_b5

    :cond_b4
    add-int/lit8 v9, v3, -0x1

    .line 867
    invoke-interface {v2, v9}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v9

    invoke-static {v9}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isLeftQuote(C)Z

    move-result v9

    if-nez v9, :cond_b5

    :goto_66
    move v6, v3

    goto :goto_67

    :cond_b5
    add-int/lit8 v3, v3, -0x1

    goto :goto_65

    :cond_b6
    :goto_67
    move/from16 v3, p3

    const/16 v11, 0xa

    goto/16 :goto_6b

    :cond_b7
    const/4 v5, 0x6

    const/16 v10, 0xc

    .line 873
    sget-boolean v3, Lcom/flyersoft/tools/A;->textDensePunc:Z

    if-nez v3, :cond_bd

    .line 874
    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-ge v6, v3, :cond_bd

    sub-int v3, v1, v4

    const/4 v9, 0x5

    if-le v3, v9, :cond_bd

    invoke-interface {v2, v6}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lcom/flyersoft/tools/A;->isCnLineBreakDot(C)Z

    move-result v3

    if-eqz v3, :cond_bd

    add-int/lit8 v3, v6, -0x1

    :goto_68
    add-int/lit8 v9, v4, 0x3

    if-le v3, v9, :cond_b6

    .line 876
    invoke-interface {v2, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v9

    invoke-static {v9}, Ljava/lang/Character;->getType(C)I

    move-result v9

    const/16 v11, 0x14

    if-lt v9, v11, :cond_b8

    invoke-interface {v2, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v9

    invoke-static {v9}, Lcom/flyersoft/tools/A;->isCnLineBreakDot(C)Z

    move-result v9

    if-nez v9, :cond_b9

    :cond_b8
    add-int/lit8 v9, v3, -0x1

    .line 877
    invoke-interface {v2, v9}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v9

    invoke-static {v9}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isLeftQuote(C)Z

    move-result v9

    if-nez v9, :cond_b9

    goto :goto_66

    :cond_b9
    add-int/lit8 v3, v3, -0x1

    goto :goto_68

    :cond_ba
    const/4 v5, 0x6

    const/16 v10, 0xc

    .line 886
    invoke-static {v9}, Lcom/flyersoft/tools/A;->isEnglishDot(C)Z

    move-result v3

    if-eqz v3, :cond_bd

    add-int/lit8 v3, v4, 0x3

    if-le v6, v3, :cond_bd

    sub-int v9, v6, v17

    add-int/lit8 v11, v9, -0x1

    aget-char v11, v69, v11

    const/16 v5, 0x20

    if-ne v11, v5, :cond_bd

    add-int/lit8 v11, v9, -0x2

    aget-char v11, v69, v11

    if-eq v11, v5, :cond_bd

    if-ge v6, v1, :cond_bd

    add-int/lit8 v9, v9, 0x1

    aget-char v9, v69, v9

    const/16 v11, 0xa

    if-eq v9, v11, :cond_bb

    if-ne v9, v5, :cond_be

    :cond_bb
    add-int/lit8 v6, v6, -0x2

    :goto_69
    if-le v6, v3, :cond_bc

    sub-int v9, v6, v17

    .line 890
    aget-char v9, v69, v9

    if-eq v9, v5, :cond_bc

    add-int/lit8 v6, v6, -0x1

    const/16 v5, 0x20

    goto :goto_69

    :cond_bc
    add-int/lit8 v6, v6, 0x1

    goto :goto_6a

    :cond_bd
    const/16 v11, 0xa

    :cond_be
    :goto_6a
    move/from16 v3, p3

    :goto_6b
    move/from16 v54, v21

    if-ne v6, v3, :cond_bf

    const/16 v21, 0x1

    goto :goto_6c

    :cond_bf
    const/16 v21, 0x0

    :goto_6c
    move/from16 v25, v17

    move-object/from16 v30, p4

    move/from16 v5, p5

    move/from16 v10, p7

    move/from16 v11, p8

    move/from16 v22, p9

    move/from16 v23, p10

    move/from16 v28, p12

    move-object/from16 v27, p13

    move/from16 v53, v0

    move v0, v1

    move v3, v4

    move v4, v6

    move/from16 v9, v50

    move/from16 v82, v54

    move/from16 v81, v73

    const/16 v65, 0x6

    const/16 v80, 0xc

    move-object/from16 v1, p0

    move/from16 v6, p6

    .line 896
    invoke-direct/range {v1 .. v30}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->out(Ljava/lang/CharSequence;IIIIIIIFF[Landroid/text/style/LineHeightSpan;[ILandroid/graphics/Paint$FontMetricsInt;ZZI[BIZZZZ[FIILcom/flyersoft/staticlayout/TextUtils$TruncateAt;FFLandroid/text/TextPaint;)I

    move-result v3

    move-object v7, v2

    move/from16 v50, v29

    move-object v2, v1

    move-object/from16 v1, p4

    move/from16 v76, v0

    move v6, v4

    move/from16 v8, v17

    move-object/from16 v2, v18

    move-object/from16 v9, v24

    move/from16 v0, v40

    move/from16 v83, v77

    move/from16 v7, v79

    const/16 v44, 0x9

    const/16 v61, 0x5

    const/16 v66, 0x3

    const/16 v67, 0x0

    goto/16 :goto_95

    :cond_c0
    const/16 v65, 0x6

    const/16 v80, 0xc

    move/from16 v53, v0

    move-object v7, v2

    move/from16 v8, v17

    move/from16 v82, v21

    move/from16 p5, v50

    move/from16 v81, v73

    move/from16 v0, v76

    move-object/from16 v69, v78

    move-object/from16 v2, p0

    move/from16 v50, v29

    move/from16 p6, v11

    move/from16 v11, v72

    :goto_6d
    if-eq v11, v4, :cond_102

    .line 911
    invoke-direct {v2}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isHyphenation()Z

    move-result v17

    if-eqz v17, :cond_100

    if-nez v37, :cond_100

    move/from16 v17, v11

    add-int/lit8 v11, v49, -0x1

    if-ge v11, v4, :cond_c1

    const/16 v21, 0x1

    goto :goto_6e

    :cond_c1
    const/16 v21, 0x0

    :goto_6e
    move/from16 v22, v11

    if-nez v21, :cond_cc

    sub-int v21, v22, v8

    .line 915
    aget-char v11, v69, v21

    move-object/from16 v25, v12

    const/16 v12, 0x22

    if-eq v11, v12, :cond_c3

    const/16 v12, 0x27

    if-eq v11, v12, :cond_c3

    const/16 v12, 0x2e

    if-ne v11, v12, :cond_c2

    goto :goto_6f

    :cond_c2
    move-object/from16 v27, v13

    goto :goto_70

    .line 917
    :cond_c3
    :goto_6f
    invoke-static {v9}, Ljava/lang/Character;->isLetter(C)Z

    move-result v12

    if-nez v12, :cond_c5

    invoke-static {v9}, Ljava/lang/Character;->getType(C)I

    move-result v12

    move-object/from16 v27, v13

    const/4 v13, 0x5

    if-ne v12, v13, :cond_c4

    goto :goto_71

    :cond_c4
    :goto_70
    const/4 v12, 0x0

    goto :goto_72

    :cond_c5
    move-object/from16 v27, v13

    :goto_71
    const/4 v12, 0x1

    :goto_72
    if-nez v12, :cond_c7

    const/16 v12, 0x2019

    if-eq v11, v12, :cond_c7

    .line 918
    invoke-static {v11}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isLeftQuote(C)Z

    move-result v12

    if-nez v12, :cond_c7

    .line 919
    invoke-static {v9}, Ljava/lang/Character;->isDigit(C)Z

    move-result v12

    if-eqz v12, :cond_c6

    invoke-static {v11}, Ljava/lang/Character;->isDigit(C)Z

    move-result v11

    if-nez v11, :cond_c7

    :cond_c6
    const/4 v11, 0x1

    goto :goto_73

    :cond_c7
    const/4 v11, 0x0

    :goto_73
    if-eqz v11, :cond_ca

    const/16 v12, 0x2019

    if-eq v9, v12, :cond_c8

    const/16 v12, 0x27

    if-eq v9, v12, :cond_c8

    const/16 v12, 0x2e

    if-ne v9, v12, :cond_ca

    :cond_c8
    add-int/lit8 v9, v49, 0x1

    if-ge v9, v0, :cond_ca

    sub-int/2addr v9, v8

    .line 922
    aget-char v9, v69, v9

    .line 923
    invoke-static {v9}, Ljava/lang/Character;->isLetter(C)Z

    move-result v12

    if-nez v12, :cond_c9

    invoke-static {v9}, Ljava/lang/Character;->getType(C)I

    move-result v9

    const/4 v12, 0x5

    if-ne v9, v12, :cond_cb

    goto :goto_74

    :cond_c9
    const/4 v12, 0x5

    :goto_74
    const/4 v13, 0x0

    goto :goto_75

    :cond_ca
    const/4 v12, 0x5

    :cond_cb
    move v13, v11

    goto :goto_75

    :cond_cc
    move-object/from16 v25, v12

    move-object/from16 v27, v13

    const/4 v12, 0x5

    move/from16 v13, v21

    :goto_75
    if-nez v13, :cond_ce

    sub-int v9, v6, v4

    const/4 v11, 0x1

    if-le v9, v11, :cond_cd

    move/from16 v71, v6

    move/from16 v30, v8

    :goto_76
    move-object/from16 v28, v14

    goto :goto_77

    :cond_cd
    move/from16 v30, v8

    move-object/from16 v28, v14

    move/from16 v71, v17

    :goto_77
    move/from16 v14, v53

    move/from16 v11, v68

    move/from16 v8, v81

    move/from16 v12, v82

    const/16 v74, 0x1

    goto/16 :goto_8b

    :cond_ce
    const/4 v11, 0x1

    add-int/lit8 v72, v17, -0x1

    move/from16 v9, v72

    :goto_78
    if-lt v9, v4, :cond_cf

    sub-int v13, v9, v8

    .line 932
    aget-char v13, v69, v13

    const/16 v12, 0x20

    if-ne v13, v12, :cond_cf

    add-int/lit8 v9, v9, -0x1

    const/4 v12, 0x5

    goto :goto_78

    :cond_cf
    add-int/lit8 v12, v9, 0x1

    if-ge v12, v0, :cond_d0

    sub-int/2addr v12, v8

    .line 936
    aget-char v12, v69, v12

    invoke-static {v12}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isRightQuote(C)Z

    move-result v12

    if-eqz v12, :cond_d0

    const/4 v12, 0x1

    goto :goto_79

    :cond_d0
    const/4 v12, 0x0

    :goto_79
    sub-int/2addr v9, v8

    if-nez v12, :cond_d3

    if-ltz v9, :cond_d3

    move-object/from16 v12, v69

    .line 938
    array-length v13, v12

    if-ge v9, v13, :cond_d4

    aget-char v13, v12, v9

    const/16 v11, 0x2019

    if-eq v13, v11, :cond_d1

    const/16 v11, 0x3a

    if-eq v13, v11, :cond_d1

    .line 939
    invoke-static {v13}, Lcom/flyersoft/tools/A;->isEnglishDot(C)Z

    move-result v11

    if-eqz v11, :cond_d4

    .line 941
    :cond_d1
    iget v11, v2, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineCount:I

    aget-char v9, v12, v9

    invoke-virtual {v2, v11, v9}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->setLineSep(II)V

    move/from16 v9, v17

    :goto_7a
    if-ge v9, v0, :cond_d2

    sub-int v11, v9, v8

    .line 942
    aget-char v11, v12, v11

    const/16 v13, 0x20

    if-ne v11, v13, :cond_d2

    add-int/lit8 v9, v9, 0x1

    goto :goto_7a

    :cond_d2
    move/from16 v30, v8

    move/from16 v71, v9

    move-object/from16 v69, v12

    goto :goto_76

    :cond_d3
    move-object/from16 v12, v69

    :cond_d4
    move/from16 v9, v17

    :goto_7b
    if-ge v9, v0, :cond_d5

    sub-int v11, v9, v8

    .line 947
    aget-char v11, v12, v11

    const/16 v13, 0x20

    if-ne v11, v13, :cond_d5

    add-int/lit8 v9, v9, 0x1

    goto :goto_7b

    :cond_d5
    sub-int v11, v9, v8

    .line 951
    aget-char v13, v12, v11

    move/from16 v17, v11

    add-int/lit8 v11, v9, 0x1

    if-ge v11, v0, :cond_d6

    sub-int v21, v11, v8

    .line 952
    aget-char v21, v12, v21

    invoke-static/range {v21 .. v21}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isRightQuote(C)Z

    move-result v21

    if-eqz v21, :cond_d6

    const/16 v21, 0x1

    goto :goto_7c

    :cond_d6
    const/16 v21, 0x0

    :goto_7c
    move-object/from16 v28, v14

    if-nez v21, :cond_d9

    const/16 v14, 0x3a

    if-eq v13, v14, :cond_d7

    .line 953
    invoke-static {v13}, Lcom/flyersoft/tools/A;->isEnglishDot(C)Z

    move-result v14

    if-nez v14, :cond_d7

    .line 954
    invoke-static {v13}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isLeftQuote(C)Z

    move-result v14

    if-nez v14, :cond_d9

    invoke-static {v13}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isRightQuote(C)Z

    move-result v14

    if-eqz v14, :cond_d9

    if-ge v11, v0, :cond_d7

    sub-int v14, v11, v8

    aget-char v14, v12, v14

    invoke-static {v14}, Lcom/flyersoft/tools/A;->isEnglishDot(C)Z

    move-result v14

    if-nez v14, :cond_d9

    :cond_d7
    add-int/lit8 v14, v9, -0x1

    if-lt v14, v4, :cond_d8

    sub-int/2addr v14, v8

    aget-char v14, v12, v14

    .line 955
    invoke-static {v14}, Ljava/lang/Character;->isDigit(C)Z

    move-result v14

    if-nez v14, :cond_d9

    :cond_d8
    if-ge v11, v0, :cond_f7

    sub-int v14, v11, v8

    aget-char v14, v12, v14

    .line 956
    invoke-static {v14}, Ljava/lang/Character;->isDigit(C)Z

    move-result v14

    if-eqz v14, :cond_f7

    :cond_d9
    const/16 v14, 0x2f

    if-eq v13, v14, :cond_da

    .line 957
    invoke-static {v13}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isConnectChar(C)Z

    move-result v14

    if-eqz v14, :cond_db

    :cond_da
    if-ge v11, v0, :cond_f7

    sub-int v14, v11, v8

    aget-char v14, v12, v14

    .line 958
    invoke-static {v14}, Ljava/lang/Character;->isDigit(C)Z

    move-result v14

    if-nez v14, :cond_db

    goto/16 :goto_88

    :cond_db
    if-eqz v21, :cond_dc

    .line 965
    invoke-static {v13}, Lcom/flyersoft/tools/A;->isEnglishDot(C)Z

    move-result v14

    if-nez v14, :cond_df

    .line 967
    :cond_dc
    invoke-static {v13}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isRightQuote(C)Z

    move-result v14

    if-eqz v14, :cond_dd

    if-lt v11, v0, :cond_df

    add-int/lit8 v11, v9, -0x1

    if-lt v11, v4, :cond_df

    sub-int/2addr v11, v8

    aget-char v11, v12, v11

    .line 968
    invoke-static {v11}, Lcom/flyersoft/tools/A;->isEnglishDot(C)Z

    move-result v11

    if-nez v11, :cond_df

    .line 969
    :cond_dd
    invoke-static {v13}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isSingleQuote(C)Z

    move-result v11

    if-nez v11, :cond_de

    invoke-static {v13}, Ljava/lang/Character;->isLetter(C)Z

    move-result v11

    if-eqz v11, :cond_f4

    const/4 v11, 0x1

    invoke-static {v13, v11}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isIdeographic(CZ)Z

    move-result v14

    if-nez v14, :cond_f4

    :cond_de
    add-int/lit8 v11, v9, -0x1

    if-lt v11, v4, :cond_f4

    add-int/lit8 v11, v17, -0x1

    aget-char v14, v12, v11

    .line 971
    invoke-static {v14}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isSingleQuote(C)Z

    move-result v14

    if-nez v14, :cond_df

    aget-char v14, v12, v11

    .line 972
    invoke-static {v14}, Ljava/lang/Character;->isLetter(C)Z

    move-result v14

    if-eqz v14, :cond_f4

    aget-char v11, v12, v11

    const/4 v14, 0x1

    .line 973
    invoke-static {v11, v14}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isIdeographic(CZ)Z

    move-result v11

    if-nez v11, :cond_f4

    .line 977
    :cond_df
    iget v11, v2, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineCount:I

    if-nez v11, :cond_e0

    const/4 v13, 0x0

    goto :goto_7d

    :cond_e0
    add-int/lit8 v11, v11, -0x1

    .line 978
    invoke-virtual {v2, v11}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->getLineEnd(I)I

    move-result v13

    :goto_7d
    move v11, v9

    move/from16 v14, v77

    :goto_7e
    if-ge v11, v14, :cond_e1

    if-ge v11, v0, :cond_e1

    sub-int v17, v11, v8

    move/from16 v21, v11

    .line 981
    aget-char v11, v12, v17

    move/from16 v22, v13

    const/16 v13, 0x20

    if-eq v11, v13, :cond_e2

    invoke-static {v11}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isConnectChar(C)Z

    move-result v11

    if-nez v11, :cond_e2

    aget-char v11, v12, v17

    const/16 v13, 0xa

    if-eq v11, v13, :cond_e2

    const/4 v13, 0x1

    invoke-static {v11, v13}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isIdeographic(CZ)Z

    move-result v11

    if-nez v11, :cond_e2

    add-int/lit8 v11, v21, 0x1

    move/from16 v13, v22

    goto :goto_7e

    :cond_e1
    move/from16 v21, v11

    move/from16 v22, v13

    :cond_e2
    sub-int v11, v21, v22

    sub-int v13, v9, v22

    move/from16 v77, v14

    const/4 v14, 0x2

    mul-int/lit8 v13, v13, 0x2

    if-ge v11, v13, :cond_ee

    move v11, v9

    :goto_7f
    if-lt v11, v8, :cond_e3

    if-lt v11, v4, :cond_e3

    sub-int v13, v11, v8

    .line 990
    aget-char v14, v12, v13

    move/from16 v30, v8

    const/16 v8, 0x20

    if-eq v14, v8, :cond_e4

    invoke-static {v14}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isConnectChar(C)Z

    move-result v8

    if-nez v8, :cond_e4

    aget-char v8, v12, v13

    const/4 v13, 0x1

    invoke-static {v8, v13}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isIdeographic(CZ)Z

    move-result v8

    if-nez v8, :cond_e4

    add-int/lit8 v11, v11, -0x1

    move/from16 v8, v30

    const/4 v14, 0x2

    goto :goto_7f

    :cond_e3
    move/from16 v30, v8

    :cond_e4
    add-int/lit8 v11, v11, 0x1

    .line 995
    new-instance v8, Lcom/flyersoft/staticlayout/SHTextWord;

    sub-int v13, v11, v30

    sub-int v14, v21, v11

    invoke-direct {v8, v12, v13, v14}, Lcom/flyersoft/staticlayout/SHTextWord;-><init>([CII)V

    .line 996
    new-instance v13, Ljava/lang/String;

    sub-int v14, v22, v30

    move/from16 v17, v11

    sub-int v11, v17, v22

    invoke-direct {v13, v12, v14, v11}, Ljava/lang/String;-><init>([CII)V

    .line 999
    iget v11, v2, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->float_width:F

    sub-float v11, v57, v11

    sub-float v11, v11, p6

    iget-object v14, v2, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mWorkPaint:Landroid/text/TextPaint;

    invoke-static {v13, v14}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v13

    sub-float/2addr v11, v13

    float-to-double v13, v11

    .line 1002
    iget v11, v8, Lcom/flyersoft/staticlayout/SHTextWord;->Length:I

    move-object/from16 v69, v12

    const/4 v12, 0x3

    if-le v11, v12, :cond_eb

    const/high16 p6, 0x40000000    # 2.0f

    iget v11, v2, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mSpaceWidth:F

    mul-float v11, v11, p6

    move-wide/from16 v21, v13

    float-to-double v12, v11

    cmpl-double v11, v21, v12

    if-ltz v11, :cond_eb

    .line 1003
    invoke-static {}, Lcom/flyersoft/staticlayout/SHTextHyphenator;->Instance()Lcom/flyersoft/staticlayout/SHTextHyphenator;

    move-result-object v11

    invoke-virtual {v11, v8}, Lcom/flyersoft/staticlayout/SHTextHyphenator;->getInfo(Lcom/flyersoft/staticlayout/SHTextWord;)Lcom/flyersoft/staticlayout/SHTextHyphenationInfo;

    move-result-object v11

    .line 1004
    iget v12, v8, Lcom/flyersoft/staticlayout/SHTextWord;->Length:I

    const/16 v74, 0x1

    add-int/lit8 v12, v12, -0x1

    .line 1008
    iget v13, v8, Lcom/flyersoft/staticlayout/SHTextWord;->Length:I

    const/4 v14, 0x0

    :goto_80
    if-lez v12, :cond_e6

    .line 1010
    iget-object v14, v8, Lcom/flyersoft/staticlayout/SHTextWord;->Data:[C

    move/from16 p6, v12

    iget v12, v8, Lcom/flyersoft/staticlayout/SHTextWord;->Offset:I

    add-int v12, v12, p6

    aget-char v12, v14, v12

    invoke-static {v12}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isConnectChar(C)Z

    move-result v14

    if-eqz v14, :cond_e5

    move/from16 v13, p6

    goto :goto_81

    :cond_e5
    add-int/lit8 v12, p6, -0x1

    goto :goto_80

    :cond_e6
    :goto_81
    if-nez v14, :cond_ea

    .line 1018
    iget v12, v8, Lcom/flyersoft/staticlayout/SHTextWord;->Length:I

    const/16 v74, 0x1

    add-int/lit8 v12, v12, -0x1

    :goto_82
    if-lez v12, :cond_e9

    .line 1020
    invoke-virtual {v11, v12}, Lcom/flyersoft/staticlayout/SHTextHyphenationInfo;->isHyphenationPossible(I)Z

    move-result v13

    if-eqz v13, :cond_e7

    .line 1022
    invoke-virtual {v8}, Lcom/flyersoft/staticlayout/SHTextWord;->toString()Ljava/lang/String;

    move-result-object v13

    iget-object v14, v2, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mWorkPaint:Landroid/text/TextPaint;

    move-object/from16 p6, v11

    const/4 v11, 0x0

    invoke-static {v13, v11, v12, v14}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;IILandroid/text/TextPaint;)F

    move-result v13

    float-to-double v13, v13

    cmpg-double v49, v13, v21

    if-gtz v49, :cond_e8

    goto :goto_83

    :cond_e7
    move-object/from16 p6, v11

    const/4 v11, 0x0

    :cond_e8
    add-int/lit8 v12, v12, -0x1

    move-object/from16 v11, p6

    goto :goto_82

    :cond_e9
    const/4 v11, 0x0

    :goto_83
    if-lez v12, :cond_eb

    add-int v8, v17, v12

    .line 1031
    iget v12, v2, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineCount:I

    const/16 v13, 0x2d

    invoke-virtual {v2, v12, v13}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->setLineSep(II)V

    move v11, v8

    const/16 v74, 0x1

    goto :goto_84

    :cond_ea
    const/4 v11, 0x0

    .line 1036
    new-instance v12, Ljava/lang/String;

    iget-object v14, v8, Lcom/flyersoft/staticlayout/SHTextWord;->Data:[C

    iget v8, v8, Lcom/flyersoft/staticlayout/SHTextWord;->Offset:I

    invoke-direct {v12, v14, v8, v13}, Ljava/lang/String;-><init>([CII)V

    .line 1037
    iget-object v8, v2, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mWorkPaint:Landroid/text/TextPaint;

    invoke-static {v12, v8}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v8

    float-to-double v11, v8

    cmpl-double v8, v21, v11

    if-ltz v8, :cond_eb

    add-int v11, v17, v13

    const/16 v74, 0x1

    add-int/lit8 v11, v11, 0x1

    .line 1039
    iget v8, v2, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineCount:I

    const/16 v12, 0x2d

    invoke-virtual {v2, v8, v12}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->setLineSep(II)V

    goto :goto_84

    :cond_eb
    const/16 v74, 0x1

    move/from16 v11, v17

    :goto_84
    if-ge v11, v9, :cond_ec

    move v8, v11

    :goto_85
    if-ge v8, v9, :cond_ed

    sub-int v12, v8, v30

    add-int v12, v12, v26

    .line 1048
    aget v12, v24, v12

    sub-float v58, v51, v12

    add-int/lit8 v8, v8, 0x1

    goto :goto_85

    :cond_ec
    if-le v11, v9, :cond_ed

    move v8, v9

    :goto_86
    if-ge v8, v11, :cond_ed

    sub-int v12, v8, v30

    add-int v12, v12, v26

    .line 1051
    aget v12, v24, v12

    add-float v58, v51, v12

    add-int/lit8 v8, v8, 0x1

    goto :goto_86

    :cond_ed
    if-eq v11, v4, :cond_ef

    move v9, v11

    goto :goto_87

    :cond_ee
    move/from16 v30, v8

    move-object/from16 v69, v12

    const/16 v74, 0x1

    :cond_ef
    :goto_87
    if-ne v9, v4, :cond_f0

    sub-int v8, v9, v30

    add-int v8, v8, v26

    .line 1059
    aget v8, v24, v8

    add-float v58, v51, v8

    add-int/lit8 v9, v9, 0x1

    :cond_f0
    move/from16 v71, v9

    move/from16 v8, v81

    if-ge v8, v3, :cond_f1

    move v3, v8

    :cond_f1
    move/from16 v11, v68

    if-ge v11, v10, :cond_f2

    move v10, v11

    :cond_f2
    move/from16 v12, v82

    if-le v12, v1, :cond_f3

    move v1, v12

    :cond_f3
    move/from16 v14, v53

    if-le v14, v5, :cond_f9

    move v5, v14

    goto/16 :goto_8b

    :cond_f4
    move/from16 v30, v8

    move-object/from16 v69, v12

    move/from16 v14, v53

    move/from16 v11, v68

    move/from16 v8, v81

    move/from16 v12, v82

    const/16 v74, 0x1

    .line 1072
    invoke-static {v13}, Ljava/lang/Character;->isLetter(C)Z

    move-result v13

    if-eqz v13, :cond_f6

    add-int/lit8 v13, v9, -0x1

    if-lt v13, v4, :cond_f6

    add-int/lit8 v13, v17, -0x1

    move/from16 v55, v1

    aget-char v1, v69, v13

    move/from16 v21, v3

    const/16 v3, 0x3a

    if-eq v1, v3, :cond_f5

    .line 1074
    invoke-static {v1}, Lcom/flyersoft/tools/A;->isEnglishDot(C)Z

    move-result v1

    if-nez v1, :cond_f5

    aget-char v1, v69, v13

    const/16 v3, 0x2f

    if-eq v1, v3, :cond_f5

    .line 1075
    invoke-static {v1}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isConnectChar(C)Z

    move-result v1

    if-eqz v1, :cond_f8

    .line 1077
    :cond_f5
    iget v1, v2, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineCount:I

    aget-char v3, v69, v13

    invoke-virtual {v2, v1, v3}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->setLineSep(II)V

    goto :goto_8a

    :cond_f6
    move/from16 v55, v1

    move/from16 v21, v3

    goto :goto_8a

    :cond_f7
    :goto_88
    move/from16 v55, v1

    move/from16 v21, v3

    move/from16 v30, v8

    move v9, v11

    move-object/from16 v69, v12

    move/from16 v14, v53

    move/from16 v11, v68

    move/from16 v8, v81

    move/from16 v12, v82

    const/16 v74, 0x1

    .line 960
    iget v1, v2, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineCount:I

    invoke-virtual {v2, v1, v13}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->setLineSep(II)V

    :goto_89
    if-ge v9, v0, :cond_f8

    sub-int v1, v9, v30

    .line 962
    aget-char v1, v69, v1

    const/16 v13, 0x20

    if-ne v1, v13, :cond_f8

    add-int/lit8 v9, v9, 0x1

    goto :goto_89

    :cond_f8
    :goto_8a
    move/from16 v71, v9

    move/from16 v3, v21

    move/from16 v1, v55

    .line 1083
    :cond_f9
    :goto_8b
    invoke-interface {v7}, Ljava/lang/CharSequence;->length()I

    move-result v9

    if-ge v6, v9, :cond_fc

    add-int/lit8 v9, v0, -0x3

    if-ne v6, v9, :cond_fc

    sub-int v9, v0, v4

    const/16 v13, 0xf

    if-le v9, v13, :cond_fc

    .line 1084
    invoke-interface {v7, v6}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v9

    invoke-static {v9}, Ljava/lang/Character;->getType(C)I

    move-result v9

    const/16 v13, 0x14

    if-lt v9, v13, :cond_fc

    add-int/lit8 v9, v6, 0x1

    invoke-interface {v7, v9}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v9

    invoke-static {v9}, Ljava/lang/Character;->getType(C)I

    move-result v9

    if-lt v9, v13, :cond_fc

    add-int/lit8 v9, v6, -0x2

    :goto_8c
    add-int/lit8 v13, v4, 0xa

    if-le v9, v13, :cond_fc

    .line 1086
    invoke-interface {v7, v9}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v13

    move/from16 v76, v0

    const/16 v0, 0x20

    if-eq v13, v0, :cond_fb

    invoke-interface {v7, v9}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    invoke-static {v0}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isConnectChar(C)Z

    move-result v0

    if-eqz v0, :cond_fa

    goto :goto_8d

    :cond_fa
    add-int/lit8 v9, v9, -0x1

    move/from16 v0, v76

    goto :goto_8c

    :cond_fb
    :goto_8d
    move/from16 v72, v9

    goto :goto_8e

    :cond_fc
    move/from16 v76, v0

    move/from16 v72, v71

    .line 1093
    :goto_8e
    invoke-interface {v7}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-ge v6, v0, :cond_ff

    add-int/lit8 v0, v76, -0x2

    if-ne v6, v0, :cond_ff

    sub-int v0, v76, v4

    const/16 v9, 0xf

    if-le v0, v9, :cond_ff

    .line 1094
    invoke-interface {v7, v6}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->getType(C)I

    move-result v0

    const/16 v13, 0x14

    if-lt v0, v13, :cond_ff

    add-int/lit8 v71, v6, -0x1

    move/from16 v0, v71

    :goto_8f
    add-int/lit8 v6, v4, 0xa

    if-le v0, v6, :cond_ff

    .line 1096
    invoke-interface {v7, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v6

    const/16 v13, 0x20

    if-eq v6, v13, :cond_fe

    invoke-interface {v7, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v6

    invoke-static {v6}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isConnectChar(C)Z

    move-result v6

    if-eqz v6, :cond_fd

    goto :goto_90

    :cond_fd
    add-int/lit8 v0, v0, -0x1

    goto :goto_8f

    :cond_fe
    :goto_90
    move v7, v3

    move v3, v4

    move v6, v5

    move v5, v10

    move v4, v0

    move v10, v1

    move/from16 v0, p3

    goto :goto_91

    :cond_ff
    move/from16 v0, p3

    move v7, v3

    move v3, v4

    move v6, v5

    move v5, v10

    move/from16 v4, v72

    move v10, v1

    goto :goto_91

    :cond_100
    move/from16 v76, v0

    move/from16 v55, v1

    move/from16 v21, v3

    move/from16 v30, v8

    move/from16 v17, v11

    move-object/from16 v25, v12

    move-object/from16 v27, v13

    move-object/from16 v28, v14

    move/from16 v14, v53

    move/from16 v11, v68

    move/from16 v8, v81

    move/from16 v12, v82

    const/16 v74, 0x1

    move/from16 v0, p3

    move v3, v4

    move v6, v5

    move v5, v10

    move/from16 v4, v17

    move/from16 v7, v21

    move/from16 v10, v55

    :goto_91
    if-ne v4, v0, :cond_101

    const/16 v21, 0x1

    goto :goto_92

    :cond_101
    const/16 v21, 0x0

    :goto_92
    move/from16 v54, v12

    move-object/from16 v12, v25

    move/from16 v25, v30

    move/from16 v9, p5

    move/from16 v22, p9

    move/from16 v23, p10

    move-object v1, v2

    move/from16 v73, v8

    move/from16 v68, v11

    move/from16 v53, v14

    move-object/from16 v13, v27

    move-object/from16 v14, v28

    move/from16 v17, v30

    move/from16 v29, v58

    move/from16 v83, v77

    const/16 v61, 0x5

    const/16 v66, 0x3

    const/16 v67, 0x0

    move-object/from16 v2, p1

    move-object/from16 v30, p4

    move/from16 v11, p8

    move/from16 v28, p12

    move-object/from16 v27, p13

    move v8, v6

    move v6, v10

    move/from16 v10, p7

    .line 1106
    invoke-direct/range {v1 .. v30}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->out(Ljava/lang/CharSequence;IIIIIIIFF[Landroid/text/style/LineHeightSpan;[ILandroid/graphics/Paint$FontMetricsInt;ZZI[BIZZZZ[FIILcom/flyersoft/staticlayout/TextUtils$TruncateAt;FFLandroid/text/TextPaint;)I

    move-result v3

    move-object v9, v1

    move-object/from16 v1, p4

    move v6, v4

    move/from16 v8, v17

    move-object/from16 v2, v18

    move-object/from16 v9, v24

    move/from16 v0, v40

    move/from16 v7, v79

    const/16 v44, 0x9

    goto/16 :goto_95

    :cond_102
    move/from16 v10, p5

    move/from16 v76, v0

    move-object v9, v2

    move v3, v4

    move/from16 v17, v8

    move/from16 v83, v77

    move/from16 v73, v81

    move/from16 v54, v82

    const/16 v61, 0x5

    const/16 v66, 0x3

    const/16 v67, 0x0

    move/from16 v0, p3

    .line 1121
    iget-object v1, v9, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz v1, :cond_103

    .line 1122
    iget-object v0, v9, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    iget-object v2, v9, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mWorkPaint:Landroid/text/TextPaint;

    add-int/lit8 v5, v3, 0x1

    const/4 v8, 0x0

    move/from16 v11, p3

    move-object/from16 v1, p4

    move v4, v3

    move-object v6, v14

    move v7, v15

    const/16 v44, 0x9

    move-object/from16 v3, p1

    invoke-static/range {v0 .. v8}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->measureText(Lcom/flyersoft/staticlayout/MRTextView;Landroid/text/TextPaint;Landroid/text/TextPaint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;Z[Ljava/lang/Object;)F

    move v3, v4

    goto :goto_93

    :cond_103
    move v11, v0

    const/16 v44, 0x9

    :goto_93
    add-int/lit8 v4, v3, 0x1

    .line 1126
    iget v5, v14, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    iget v6, v14, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    iget v7, v14, Landroid/graphics/Paint$FontMetricsInt;->top:I

    iget v8, v14, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    if-ne v4, v11, :cond_104

    const/16 v21, 0x1

    goto :goto_94

    :cond_104
    const/16 v21, 0x0

    :goto_94
    sub-int v0, v3, v17

    aget v29, v24, v0

    move/from16 v25, v17

    move-object/from16 v2, p1

    move-object/from16 v30, p4

    move/from16 v11, p8

    move/from16 v22, p9

    move/from16 v23, p10

    move/from16 v28, p12

    move-object/from16 v27, p13

    move-object v1, v9

    move v9, v10

    move/from16 v0, v40

    move/from16 v10, p7

    invoke-direct/range {v1 .. v30}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->out(Ljava/lang/CharSequence;IIIIIIIFF[Landroid/text/style/LineHeightSpan;[ILandroid/graphics/Paint$FontMetricsInt;ZZI[BIZZZZ[FIILcom/flyersoft/staticlayout/TextUtils$TruncateAt;FFLandroid/text/TextPaint;)I

    move-result v3

    move/from16 v8, v17

    move-object/from16 v2, v18

    move-object/from16 v9, v24

    move-object/from16 v1, v30

    move v6, v4

    move/from16 v7, v79

    :goto_95
    if-ge v6, v7, :cond_105

    move v4, v6

    move/from16 v76, v4

    goto :goto_96

    :cond_105
    add-int/lit8 v4, v6, -0x1

    :goto_96
    move/from16 v11, v75

    if-le v0, v11, :cond_106

    move/from16 v40, v0

    move/from16 v49, v4

    move v5, v6

    move/from16 v71, v5

    move/from16 v72, v71

    move/from16 v18, v11

    goto :goto_97

    :cond_106
    move/from16 v18, v0

    move/from16 v40, v18

    move/from16 v49, v4

    move v5, v6

    move/from16 v71, v5

    move/from16 v72, v71

    :goto_97
    move/from16 v29, v50

    const/4 v0, 0x1

    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v10, 0x0

    const/16 v17, 0x0

    const/16 v21, 0x0

    const/16 v23, 0x0

    const/16 v55, 0x0

    const/16 v70, 0x0

    move/from16 v50, v3

    const/4 v3, 0x0

    :goto_98
    add-int/lit8 v22, v49, 0x1

    move/from16 v0, v47

    move/from16 v47, v7

    move/from16 v7, v22

    move/from16 v22, v0

    move/from16 v67, v4

    move-object/from16 v24, v9

    move-object/from16 v25, v12

    move-object/from16 v27, v13

    move-object/from16 v28, v14

    move/from16 v51, v15

    move/from16 v46, v19

    move/from16 v63, v26

    move/from16 v26, v48

    move/from16 v9, v50

    move/from16 v4, v52

    move-object/from16 v1, v56

    move/from16 v0, v68

    move/from16 v12, v76

    move/from16 v15, v83

    move-object/from16 v52, v2

    move v14, v3

    move v13, v8

    move v2, v10

    move/from16 v48, v11

    move/from16 v68, v17

    move/from16 v8, v18

    move/from16 v10, v55

    move-object/from16 v11, v69

    move-object/from16 v3, p0

    move/from16 v18, v5

    move/from16 v69, v21

    move/from16 v5, v73

    goto/16 :goto_41

    :cond_107
    move-object/from16 v56, v1

    move/from16 v62, v8

    move/from16 v55, v10

    move/from16 v76, v12

    move/from16 v21, v14

    move/from16 v83, v15

    move/from16 v3, v18

    move/from16 v47, v22

    move/from16 v5, v23

    move/from16 v50, v29

    move/from16 v19, v46

    move/from16 v15, v67

    move/from16 v18, v68

    move/from16 v22, v69

    move/from16 v17, v72

    const/16 v44, 0x9

    const/16 v46, 0x0

    const/16 v61, 0x5

    const/16 v65, 0x6

    const/16 v66, 0x3

    move-object/from16 v1, p4

    move v10, v2

    move/from16 v29, v6

    move-object/from16 v69, v11

    move/from16 v11, v48

    move-object/from16 v2, v52

    move/from16 v6, v71

    move/from16 v52, v4

    move v4, v9

    move/from16 v48, v26

    move/from16 v26, v63

    const/16 v63, 0x0

    move-object v14, v2

    move/from16 v59, v6

    move v12, v11

    move/from16 v53, v15

    move/from16 v60, v17

    move/from16 v54, v18

    move/from16 v46, v19

    move/from16 v18, v21

    move-object/from16 v0, v24

    move/from16 v5, v26

    move-object/from16 v24, v28

    move-object/from16 v9, v45

    move/from16 v26, v48

    move/from16 v57, v50

    move/from16 v49, v55

    move-object/from16 v1, v56

    move-object/from16 v11, v69

    move/from16 v56, v70

    move/from16 v7, v76

    move/from16 v15, v83

    move-object/from16 v2, p1

    move v6, v3

    move/from16 v50, v10

    move/from16 v55, v22

    move/from16 v22, v47

    move/from16 v3, v62

    move/from16 v47, v64

    goto/16 :goto_3a

    :cond_108
    move-object/from16 v1, p4

    move v3, v6

    move-object/from16 v45, v9

    move-object/from16 v69, v11

    move v11, v12

    move v8, v13

    move-object v2, v14

    move-object/from16 v14, v24

    move-object/from16 v12, v25

    move/from16 v48, v26

    move-object/from16 v13, v27

    move/from16 v19, v46

    move/from16 v64, v47

    const/16 v46, 0x0

    const/16 v63, 0x0

    const/16 v67, 0x0

    const/16 v80, 0xc

    move-object v9, v0

    move/from16 v24, v4

    move/from16 v26, v5

    move v4, v15

    move/from16 v47, v22

    const/4 v0, 0x1

    if-eq v4, v3, :cond_10b

    or-int v5, v18, v23

    or-int v5, v5, v49

    or-int v5, v5, v50

    if-nez v5, :cond_109

    .line 1164
    invoke-virtual {v1, v14}, Landroid/text/TextPaint;->getFontMetricsInt(Landroid/graphics/Paint$FontMetricsInt;)I

    .line 1166
    iget v5, v14, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 1167
    iget v6, v14, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    .line 1168
    iget v7, v14, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    .line 1169
    iget v10, v14, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    move/from16 v23, v7

    move v7, v5

    move/from16 v5, v23

    move/from16 v23, v6

    move v6, v10

    goto :goto_99

    :cond_109
    move/from16 v7, v18

    move/from16 v6, v49

    move/from16 v5, v50

    :goto_99
    move/from16 v10, p3

    if-ne v4, v10, :cond_10a

    const/16 v21, 0x1

    goto :goto_9a

    :cond_10a
    const/16 v21, 0x0

    :goto_9a
    move/from16 v25, v8

    move/from16 v0, v24

    move-object/from16 v24, v9

    move v9, v0

    move/from16 v22, p9

    move/from16 v28, p12

    move-object/from16 v27, p13

    move-object/from16 v30, v1

    move-object/from16 v18, v2

    move/from16 v17, v8

    move v0, v10

    move/from16 v75, v11

    move/from16 v8, v23

    move/from16 v15, v51

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v10, p7

    move/from16 v11, p8

    move/from16 v23, p10

    .line 1172
    invoke-direct/range {v1 .. v30}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->out(Ljava/lang/CharSequence;IIIIIIIFF[Landroid/text/style/LineHeightSpan;[ILandroid/graphics/Paint$FontMetricsInt;ZZI[BIZZZZ[FIILcom/flyersoft/staticlayout/TextUtils$TruncateAt;FFLandroid/text/TextPaint;)I

    move-result v3

    move-object/from16 v5, v30

    goto :goto_9b

    :cond_10b
    move/from16 v0, v24

    move-object/from16 v24, v9

    move v9, v0

    move/from16 v0, p3

    move-object v5, v1

    move-object/from16 v18, v2

    move/from16 v75, v11

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move v3, v9

    :goto_9b
    move-object v6, v14

    move/from16 v7, v64

    if-ne v4, v7, :cond_10c

    add-int v3, v3, v38

    :cond_10c
    if-ne v4, v0, :cond_10d

    goto :goto_9c

    .line 1192
    :cond_10d
    iget-object v8, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz v8, :cond_10e

    iget-object v8, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    iget-boolean v8, v8, Lcom/flyersoft/staticlayout/MRTextView;->alone:Z

    if-eqz v8, :cond_10e

    iget-object v8, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    iget v8, v8, Lcom/flyersoft/staticlayout/MRTextView;->maxLines:I

    if-lez v8, :cond_10e

    iget v8, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineCount:I

    iget-object v9, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    iget v9, v9, Lcom/flyersoft/staticlayout/MRTextView;->maxLines:I

    if-le v8, v9, :cond_10e

    const/4 v11, 0x1

    .line 1193
    new-array v4, v11, [Ljava/lang/Object;

    const-string v7, "mLineCount > tv.maxLines, break"

    aput-object v7, v4, v67

    invoke-static {v4}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    :goto_9c
    move v8, v3

    move-object/from16 v17, v18

    move-object/from16 v23, v24

    goto :goto_9d

    :cond_10e
    const/4 v11, 0x1

    move/from16 v25, v7

    move-object/from16 v14, v18

    move/from16 v23, v35

    move/from16 v8, v38

    move-object/from16 v10, v39

    move-object/from16 v9, v45

    move/from16 v22, v47

    move/from16 v15, v48

    move-object/from16 v11, v69

    move/from16 v12, v75

    const/16 v19, 0xa

    move v7, v3

    move v3, v0

    move-object/from16 v0, v24

    move/from16 v24, v4

    move-object v4, v5

    move-object v5, v13

    move/from16 v13, v24

    goto/16 :goto_4

    :cond_10f
    move-object v10, v0

    move v0, v3

    move-object v5, v4

    move v8, v7

    move-object/from16 v23, v10

    move-object/from16 v17, v14

    :goto_9d
    move/from16 v3, p2

    if-eq v0, v3, :cond_110

    add-int/lit8 v4, v0, -0x1

    .line 1199
    invoke-interface {v2, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    const/16 v10, 0xa

    if-ne v4, v10, :cond_111

    .line 1200
    :cond_110
    invoke-virtual {v5, v6}, Landroid/text/TextPaint;->getFontMetricsInt(Landroid/graphics/Paint$FontMetricsInt;)I

    .line 1201
    iget v4, v6, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    iget v5, v6, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    iget v7, v6, Landroid/graphics/Paint$FontMetricsInt;->top:I

    move v9, v7

    iget v7, v6, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    const/16 v25, 0x0

    const/16 v28, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v14, 0x0

    const/16 v19, 0x1

    const/16 v20, 0x1

    move/from16 v3, p3

    move/from16 v15, v16

    move/from16 v16, p3

    move-object v10, v2

    move v2, v0

    move-object v0, v1

    move-object v1, v10

    move/from16 v24, p2

    move-object/from16 v29, p4

    move/from16 v10, p8

    move/from16 v21, p9

    move/from16 v22, p10

    move/from16 v27, p12

    move-object/from16 v26, p13

    move-object v13, v6

    move v6, v9

    const/16 v18, 0x1

    move/from16 v9, p7

    invoke-direct/range {v0 .. v29}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->out(Ljava/lang/CharSequence;IIIIIIIFF[Landroid/text/style/LineHeightSpan;[ILandroid/graphics/Paint$FontMetricsInt;ZZI[BIZZZZ[FIILcom/flyersoft/staticlayout/TextUtils$TruncateAt;FFLandroid/text/TextPaint;)I

    move-object v1, v0

    .line 1213
    :cond_111
    iget-object v0, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz v0, :cond_112

    .line 1214
    iget-object v0, v1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    const/4 v7, 0x2

    iput v7, v0, Lcom/flyersoft/staticlayout/MRTextView;->layoutState:I

    :cond_112
    return-void
.end method

.method public getBottomPadding()I
    .locals 1

    .line 1590
    iget v0, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mBottomPadding:I

    return v0
.end method

.method public getEllipsisCount(I)I
    .locals 2

    .line 1595
    iget v0, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mColumns:I

    const/4 v1, 0x6

    if-ge v0, v1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 1598
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLines:[I

    mul-int v0, v0, p1

    add-int/lit8 v0, v0, 0x5

    aget p1, v1, v0

    return p1
.end method

.method public getEllipsisStart(I)I
    .locals 2

    .line 1603
    iget v0, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mColumns:I

    const/4 v1, 0x6

    if-ge v0, v1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 1606
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLines:[I

    mul-int v0, v0, p1

    add-int/lit8 v0, v0, 0x4

    aget p1, v1, v0

    return p1
.end method

.method public getEllipsizedWidth()I
    .locals 1

    .line 1611
    iget v0, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mEllipsizedWidth:I

    return v0
.end method

.method public getLineContainsTab(I)Z
    .locals 2

    .line 1578
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLines:[I

    iget v1, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mColumns:I

    mul-int v1, v1, p1

    aget p1, v0, v1

    const/high16 v0, 0x20000000

    and-int/2addr p1, v0

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public getLineCount()I
    .locals 1

    .line 1535
    iget v0, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineCount:I

    return v0
.end method

.method public getLineDescent(I)I
    .locals 2

    .line 1566
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLines:[I

    iget v1, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mColumns:I

    mul-int v1, v1, p1

    add-int/lit8 v1, v1, 0x2

    aget p1, v0, v1

    return p1
.end method

.method public final getLineDirections(I)Lcom/flyersoft/staticlayout/MyLayout$Directions;
    .locals 1

    .line 1582
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineDirections:[Lcom/flyersoft/staticlayout/MyLayout$Directions;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public getLineForVertical(I)I
    .locals 6

    .line 1515
    iget v0, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineCount:I

    .line 1518
    iget-object v1, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLines:[I

    const/4 v2, -0x1

    :goto_0
    sub-int v3, v0, v2

    const/4 v4, 0x1

    if-le v3, v4, :cond_1

    add-int v3, v0, v2

    shr-int/2addr v3, v4

    .line 1521
    iget v5, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mColumns:I

    mul-int v5, v5, v3

    add-int/2addr v5, v4

    aget v4, v1, v5

    const v5, 0x1fffffff

    and-int/2addr v4, v5

    if-le v4, p1, :cond_0

    move v0, v3

    goto :goto_0

    :cond_0
    move v2, v3

    goto :goto_0

    :cond_1
    if-gez v2, :cond_2

    const/4 p1, 0x0

    return p1

    :cond_2
    return v2
.end method

.method public getLineStart(I)I
    .locals 2

    .line 1570
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLines:[I

    iget v1, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mColumns:I

    mul-int v1, v1, p1

    aget p1, v0, v1

    const v0, 0x1fffffff

    and-int/2addr p1, v0

    return p1
.end method

.method public getLineTop(I)I
    .locals 2

    .line 1539
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLines:[I

    iget v1, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mColumns:I

    mul-int v1, v1, p1

    add-int/lit8 v1, v1, 0x1

    aget p1, v0, v1

    const v0, 0x1fffffff

    and-int/2addr p1, v0

    return p1
.end method

.method public getParagraphDirection(I)I
    .locals 2

    .line 1574
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLines:[I

    iget v1, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mColumns:I

    mul-int v1, v1, p1

    aget p1, v0, v1

    shr-int/lit8 p1, p1, 0x1e

    return p1
.end method

.method public getTopPadding()I
    .locals 1

    .line 1586
    iget v0, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mTopPadding:I

    return v0
.end method

.method getTv()Lcom/flyersoft/staticlayout/MRTextView;
    .locals 1

    .line 113
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    return-object v0

    :cond_0
    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    return-object v0
.end method

.method public isBidirectional()Z
    .locals 1

    .line 1557
    iget-boolean v0, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mIsBidirectional:Z

    return v0
.end method

.method public isCJK()Z
    .locals 1

    .line 1561
    iget-boolean v0, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mIsCJK:Z

    return v0
.end method

.method public setLineStart(II)V
    .locals 3

    .line 1550
    iget v0, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mColumns:I

    mul-int v0, v0, p1

    .line 1551
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->verifymLines(I)V

    .line 1552
    iget-object p1, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLines:[I

    aget v1, p1, v0

    const/high16 v2, -0x20000000

    and-int/2addr v1, v2

    or-int/2addr p2, v1

    .line 1553
    aput p2, p1, v0

    return-void
.end method

.method public setLineTop(II)V
    .locals 3

    .line 1543
    iget v0, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mColumns:I

    mul-int v0, v0, p1

    add-int/lit8 v0, v0, 0x1

    .line 1544
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->verifymLines(I)V

    .line 1545
    iget-object p1, p0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLines:[I

    aget v1, p1, v0

    const/high16 v2, -0x20000000

    and-int/2addr v1, v2

    or-int/2addr p2, v1

    .line 1546
    aput p2, p1, v0

    return-void
.end method
