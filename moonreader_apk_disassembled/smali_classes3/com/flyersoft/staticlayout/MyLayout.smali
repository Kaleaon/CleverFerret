.class public abstract Lcom/flyersoft/staticlayout/MyLayout;
.super Ljava/lang/Object;
.source "MyLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/staticlayout/MyLayout$Alignment;,
        Lcom/flyersoft/staticlayout/MyLayout$Directions;,
        Lcom/flyersoft/staticlayout/MyLayout$SpannedEllipsizer;,
        Lcom/flyersoft/staticlayout/MyLayout$Ellipsizer;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field static final DIRS_ALL_LEFT_TO_RIGHT:Lcom/flyersoft/staticlayout/MyLayout$Directions;

.field static final DIRS_ALL_RIGHT_TO_LEFT:Lcom/flyersoft/staticlayout/MyLayout$Directions;

.field public static final DIR_LEFT_TO_RIGHT:I = 0x1

.field public static final DIR_RIGHT_TO_LEFT:I = -0x1

.field static final MAX_EMOJI:I = -0x1

.field static final MIN_EMOJI:I = -0x1

.field private static final TAB_INCREMENT:I = 0x14

.field private static sTempRect:Landroid/graphics/Rect;


# instance fields
.field floatLineSpans:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/flyersoft/staticlayout/MyFloatSpan;",
            ">;"
        }
    .end annotation
.end field

.field floatLines:Landroid/util/SparseIntArray;

.field hyphLines:Landroid/util/SparseIntArray;

.field private mAlignment:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

.field private mEmojiRect:Landroid/graphics/RectF;

.field private mPaint:Landroid/text/TextPaint;

.field private mSpacingAdd:F

.field private mSpacingMult:F

.field private mSpannedText:Z

.field mText:Ljava/lang/CharSequence;

.field private mWidth:I

.field mWorkPaint:Landroid/text/TextPaint;

.field public sizes:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "[F>;"
        }
    .end annotation
.end field

.field topAddedLines:Landroid/util/SparseIntArray;

.field topAddedLines2:Landroid/util/SparseIntArray;

.field public tv:Lcom/flyersoft/staticlayout/MRTextView;

.field public words:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static bridge synthetic -$$Nest$mellipsize(Lcom/flyersoft/staticlayout/MyLayout;III[CI)V
    .locals 0

    invoke-direct/range {p0 .. p5}, Lcom/flyersoft/staticlayout/MyLayout;->ellipsize(III[CI)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1494
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Lcom/flyersoft/staticlayout/MyLayout;->sTempRect:Landroid/graphics/Rect;

    .line 1509
    new-instance v0, Lcom/flyersoft/staticlayout/MyLayout$Directions;

    const/4 v1, 0x1

    new-array v1, v1, [S

    const/16 v2, 0x7fff

    const/4 v3, 0x0

    aput-short v2, v1, v3

    invoke-direct {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout$Directions;-><init>([S)V

    sput-object v0, Lcom/flyersoft/staticlayout/MyLayout;->DIRS_ALL_LEFT_TO_RIGHT:Lcom/flyersoft/staticlayout/MyLayout$Directions;

    .line 1511
    new-instance v0, Lcom/flyersoft/staticlayout/MyLayout$Directions;

    const/4 v1, 0x2

    new-array v1, v1, [S

    fill-array-data v1, :array_0

    invoke-direct {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout$Directions;-><init>([S)V

    sput-object v0, Lcom/flyersoft/staticlayout/MyLayout;->DIRS_ALL_RIGHT_TO_LEFT:Lcom/flyersoft/staticlayout/MyLayout$Directions;

    return-void

    :array_0
    .array-data 2
        0x0s
        0x7fffs
    .end array-data
.end method

.method protected constructor <init>(Lcom/flyersoft/staticlayout/MyTextView;Ljava/lang/CharSequence;Landroid/text/TextPaint;ILcom/flyersoft/staticlayout/MyLayout$Alignment;FF)V
    .locals 1

    .line 179
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->words:Ljava/util/HashMap;

    .line 51
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->sizes:Ljava/util/HashMap;

    .line 1491
    sget-object v0, Lcom/flyersoft/staticlayout/MyLayout$Alignment;->ALIGN_LEFT:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    iput-object v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->mAlignment:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    if-ltz p4, :cond_0

    .line 182
    check-cast p1, Lcom/flyersoft/staticlayout/MRTextView;

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MyLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    .line 183
    iput-object p2, p0, Lcom/flyersoft/staticlayout/MyLayout;->mText:Ljava/lang/CharSequence;

    .line 184
    iput-object p3, p0, Lcom/flyersoft/staticlayout/MyLayout;->mPaint:Landroid/text/TextPaint;

    .line 185
    new-instance p1, Landroid/text/TextPaint;

    invoke-direct {p1}, Landroid/text/TextPaint;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MyLayout;->mWorkPaint:Landroid/text/TextPaint;

    .line 186
    iput p4, p0, Lcom/flyersoft/staticlayout/MyLayout;->mWidth:I

    .line 187
    iput-object p5, p0, Lcom/flyersoft/staticlayout/MyLayout;->mAlignment:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    .line 188
    iput p6, p0, Lcom/flyersoft/staticlayout/MyLayout;->mSpacingMult:F

    .line 189
    iput p7, p0, Lcom/flyersoft/staticlayout/MyLayout;->mSpacingAdd:F

    .line 190
    instance-of p1, p2, Landroid/text/Spanned;

    iput-boolean p1, p0, Lcom/flyersoft/staticlayout/MyLayout;->mSpannedText:Z

    return-void

    .line 181
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "Layout: "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, " < 0"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static alignNormal(Lcom/flyersoft/staticlayout/MyLayout$Alignment;)Z
    .locals 1

    .line 415
    sget-object v0, Lcom/flyersoft/staticlayout/MyLayout$Alignment;->ALIGN_LEFT:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    if-eq p0, v0, :cond_1

    sget-object v0, Lcom/flyersoft/staticlayout/MyLayout$Alignment;->ALIGN_JUSTIFY:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

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

.method private drawText(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIILcom/flyersoft/staticlayout/MyLayout$Directions;FIIILandroid/text/TextPaint;Landroid/text/TextPaint;Z[Ljava/lang/Object;)V
    .locals 20

    move-object/from16 v0, p0

    move/from16 v6, p5

    const/4 v1, -0x1

    if-ne v6, v1, :cond_0

    .line 1026
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    const/4 v7, 0x0

    const/4 v14, 0x0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move/from16 v4, p3

    move/from16 v5, p4

    move/from16 v8, p7

    move/from16 v9, p8

    move/from16 v10, p9

    move/from16 v11, p10

    move-object/from16 v12, p11

    move-object/from16 v13, p12

    invoke-static/range {v1 .. v14}, Lcom/flyersoft/staticlayout/Styled;->drawText(Lcom/flyersoft/staticlayout/MRTextView;Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIIZFIIILandroid/text/TextPaint;Landroid/text/TextPaint;Z)F

    return-void

    :cond_0
    move-object/from16 v3, p2

    move/from16 v15, p3

    move/from16 v1, p4

    const/4 v2, 0x0

    if-nez p13, :cond_1

    const/4 v4, 0x0

    goto :goto_0

    :cond_1
    sub-int v4, v1, v15

    .line 1031
    invoke-static {v4}, Lcom/flyersoft/staticlayout/TextUtils;->obtain(I)[C

    move-result-object v4

    .line 1032
    invoke-static {v3, v15, v1, v4, v2}, Lcom/flyersoft/staticlayout/TextUtils;->getChars(Ljava/lang/CharSequence;II[CI)V

    :goto_0
    move-object/from16 v16, v4

    if-eqz p6, :cond_a

    .line 1038
    invoke-static/range {p6 .. p6}, Lcom/flyersoft/staticlayout/MyLayout$Directions;->-$$Nest$fgetmDirections(Lcom/flyersoft/staticlayout/MyLayout$Directions;)[S

    move-result-object v4

    if-eqz v4, :cond_a

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 1039
    :goto_1
    invoke-static/range {p6 .. p6}, Lcom/flyersoft/staticlayout/MyLayout$Directions;->-$$Nest$fgetmDirections(Lcom/flyersoft/staticlayout/MyLayout$Directions;)[S

    move-result-object v7

    array-length v7, v7

    if-ge v5, v7, :cond_a

    .line 1040
    invoke-static/range {p6 .. p6}, Lcom/flyersoft/staticlayout/MyLayout$Directions;->-$$Nest$fgetmDirections(Lcom/flyersoft/staticlayout/MyLayout$Directions;)[S

    move-result-object v7

    aget-short v7, v7, v5

    add-int/2addr v7, v6

    sub-int v8, v1, v15

    if-le v7, v8, :cond_2

    move v7, v8

    :cond_2
    if-eqz p13, :cond_3

    move v8, v6

    goto :goto_2

    :cond_3
    move v8, v7

    :goto_2
    move/from16 v17, v4

    move v4, v8

    :goto_3
    if-gt v4, v7, :cond_9

    const/16 v8, 0x9

    if-eq v4, v7, :cond_5

    .line 1046
    aget-char v9, v16, v4

    if-ne v9, v8, :cond_4

    goto :goto_4

    :cond_4
    move v0, v15

    move v15, v4

    move v4, v0

    move/from16 v18, v5

    move v0, v7

    const/16 v19, 0x0

    move-object/from16 v7, p14

    move v5, v1

    move v1, v6

    move/from16 v6, p5

    goto/16 :goto_8

    .line 1047
    :cond_5
    :goto_4
    iget-object v9, v0, Lcom/flyersoft/staticlayout/MyLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    add-int/2addr v6, v15

    move v10, v5

    add-int v5, v15, v4

    and-int/lit8 v11, v10, 0x1

    const/4 v12, 0x1

    if-eqz v11, :cond_6

    move v11, v7

    const/4 v7, 0x1

    goto :goto_5

    :cond_6
    move v11, v7

    const/4 v7, 0x0

    :goto_5
    const/16 v13, 0x9

    add-float v8, p7, v17

    if-eq v5, v1, :cond_7

    const/4 v14, 0x1

    goto :goto_6

    :cond_7
    const/4 v14, 0x0

    :goto_6
    move-object/from16 v2, p1

    move-object/from16 v12, p11

    move-object/from16 v13, p12

    move v15, v4

    move v4, v6

    move-object v1, v9

    move/from16 v18, v10

    move v0, v11

    const/16 v19, 0x0

    move/from16 v6, p5

    move/from16 v9, p8

    move/from16 v10, p9

    move/from16 v11, p10

    invoke-static/range {v1 .. v14}, Lcom/flyersoft/staticlayout/Styled;->drawText(Lcom/flyersoft/staticlayout/MRTextView;Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIIZFIIILandroid/text/TextPaint;Landroid/text/TextPaint;Z)F

    move-result v1

    add-float v17, v17, v1

    if-eq v15, v0, :cond_8

    .line 1053
    aget-char v1, v16, v15

    const/16 v13, 0x9

    if-ne v1, v13, :cond_8

    int-to-float v1, v6

    mul-float v2, v17, v1

    move/from16 v4, p3

    move/from16 v5, p4

    move-object/from16 v7, p14

    .line 1054
    invoke-static {v3, v4, v5, v2, v7}, Lcom/flyersoft/staticlayout/MyLayout;->nextTab(Ljava/lang/CharSequence;IIF[Ljava/lang/Object;)F

    move-result v2

    mul-float v1, v1, v2

    move/from16 v17, v1

    goto :goto_7

    :cond_8
    move/from16 v4, p3

    move/from16 v5, p4

    move-object/from16 v7, p14

    :goto_7
    add-int/lit8 v1, v15, 0x1

    :goto_8
    add-int/lit8 v2, v15, 0x1

    move v7, v0

    move v6, v1

    move v15, v4

    move v1, v5

    move/from16 v5, v18

    move-object/from16 v0, p0

    move v4, v2

    const/4 v2, 0x0

    goto :goto_3

    :cond_9
    move/from16 v6, p5

    move/from16 v18, v5

    move v0, v7

    move v4, v15

    const/16 v19, 0x0

    move-object/from16 v7, p14

    move v5, v1

    add-int/lit8 v1, v18, 0x1

    move v2, v5

    move v5, v1

    move v1, v2

    move v6, v0

    move/from16 v4, v17

    const/4 v2, 0x0

    move-object/from16 v0, p0

    goto/16 :goto_1

    :cond_a
    if-eqz p13, :cond_b

    .line 1063
    invoke-static/range {v16 .. v16}, Lcom/flyersoft/staticlayout/TextUtils;->recycle([C)V

    :cond_b
    return-void
.end method

.method private ellipsize(III[CI)V
    .locals 5

    .line 1349
    invoke-virtual {p0, p3}, Lcom/flyersoft/staticlayout/MyLayout;->getEllipsisCount(I)I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_2

    .line 1355
    :cond_0
    invoke-virtual {p0, p3}, Lcom/flyersoft/staticlayout/MyLayout;->getEllipsisStart(I)I

    move-result v1

    .line 1356
    invoke-virtual {p0, p3}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result p3

    move v2, v1

    :goto_0
    add-int v3, v1, v0

    if-ge v2, v3, :cond_3

    if-ne v2, v1, :cond_1

    const/16 v3, 0x2026

    goto :goto_1

    :cond_1
    const v3, 0xfeff

    :goto_1
    add-int v4, v2, p3

    if-lt v4, p1, :cond_2

    if-ge v4, p2, :cond_2

    add-int/2addr v4, p5

    sub-int/2addr v4, p1

    .line 1370
    aput-char v3, p4, v4

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    :goto_2
    return-void
.end method

.method public static getDesiredWidth(Lcom/flyersoft/staticlayout/MRTextView;Ljava/lang/CharSequence;IILandroid/text/TextPaint;)F
    .locals 9

    .line 152
    new-instance v2, Landroid/text/TextPaint;

    invoke-direct {v2}, Landroid/text/TextPaint;-><init>()V

    const/4 v0, 0x0

    move v4, p2

    const/4 p2, 0x0

    :goto_0
    if-gt v4, p3, :cond_2

    const/16 v0, 0xa

    .line 156
    invoke-static {p1, v0, v4, p3}, Lcom/flyersoft/staticlayout/TextUtils;->indexOf(Ljava/lang/CharSequence;CII)I

    move-result v0

    if-gez v0, :cond_0

    move v5, p3

    goto :goto_1

    :cond_0
    move v5, v0

    :goto_1
    const/4 v7, 0x1

    const/4 v8, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v3, p1

    move-object v1, p4

    .line 161
    invoke-static/range {v0 .. v8}, Lcom/flyersoft/staticlayout/MyLayout;->measureText(Lcom/flyersoft/staticlayout/MRTextView;Landroid/text/TextPaint;Landroid/text/TextPaint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;Z[Ljava/lang/Object;)F

    move-result p0

    cmpl-float p1, p0, p2

    if-lez p1, :cond_1

    move p2, p0

    :cond_1
    add-int/lit8 v4, v5, 0x1

    move-object p0, v0

    move-object p4, v1

    move-object p1, v3

    goto :goto_0

    :cond_2
    return p2
.end method

.method public static getDesiredWidth(Lcom/flyersoft/staticlayout/MRTextView;Ljava/lang/CharSequence;Landroid/text/TextPaint;)F
    .locals 2

    const/4 v0, 0x0

    .line 141
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    invoke-static {p0, p1, v0, v1, p2}, Lcom/flyersoft/staticlayout/MyLayout;->getDesiredWidth(Lcom/flyersoft/staticlayout/MRTextView;Ljava/lang/CharSequence;IILandroid/text/TextPaint;)F

    move-result p0

    return p0
.end method

.method private getHorizontal(IZZ)F
    .locals 1

    .line 575
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForOffset(I)I

    move-result v0

    .line 577
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/flyersoft/staticlayout/MyLayout;->getHorizontal(IZZI)F

    move-result p1

    return p1
.end method

.method private getHorizontal(IZZI)F
    .locals 16

    move-object/from16 v0, p0

    move/from16 v1, p4

    .line 582
    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v6

    .line 583
    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineVisibleEnd(I)I

    move-result v11

    .line 584
    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getParagraphDirection(I)I

    move-result v9

    .line 585
    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineContainsTab(I)Z

    move-result v14

    .line 586
    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineDirections(I)Lcom/flyersoft/staticlayout/MyLayout$Directions;

    move-result-object v10

    if-eqz v14, :cond_0

    .line 589
    iget-object v2, v0, Lcom/flyersoft/staticlayout/MyLayout;->mText:Ljava/lang/CharSequence;

    instance-of v2, v2, Landroid/text/Spanned;

    if-eqz v2, :cond_0

    .line 590
    iget-object v2, v0, Lcom/flyersoft/staticlayout/MyLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v2, v1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineSpans(I)[Ljava/lang/Object;

    move-result-object v2

    const-class v3, Landroid/text/style/TabStopSpan;

    invoke-static {v2, v3}, Lcom/flyersoft/tools/T;->getSpans([Ljava/lang/Object;Ljava/lang/Class;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Landroid/text/style/TabStopSpan;

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    move-object v15, v2

    .line 593
    iget-object v2, v0, Lcom/flyersoft/staticlayout/MyLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    iget-object v3, v0, Lcom/flyersoft/staticlayout/MyLayout;->mPaint:Landroid/text/TextPaint;

    iget-object v4, v0, Lcom/flyersoft/staticlayout/MyLayout;->mWorkPaint:Landroid/text/TextPaint;

    iget-object v5, v0, Lcom/flyersoft/staticlayout/MyLayout;->mText:Ljava/lang/CharSequence;

    move/from16 v7, p1

    move/from16 v12, p3

    move v8, v11

    move v13, v14

    move-object v14, v15

    move/from16 v11, p2

    invoke-static/range {v2 .. v14}, Lcom/flyersoft/staticlayout/MyLayout;->measureText(Lcom/flyersoft/staticlayout/MRTextView;Landroid/text/TextPaint;Landroid/text/TextPaint;Ljava/lang/CharSequence;IIIILcom/flyersoft/staticlayout/MyLayout$Directions;ZZZ[Ljava/lang/Object;)F

    move-result v2

    move v11, v8

    move v3, v9

    move v14, v13

    const/4 v4, -0x1

    move/from16 v12, p1

    if-le v12, v11, :cond_2

    if-ne v3, v4, :cond_1

    .line 598
    iget-object v7, v0, Lcom/flyersoft/staticlayout/MyLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    iget-object v8, v0, Lcom/flyersoft/staticlayout/MyLayout;->mPaint:Landroid/text/TextPaint;

    iget-object v9, v0, Lcom/flyersoft/staticlayout/MyLayout;->mWorkPaint:Landroid/text/TextPaint;

    iget-object v10, v0, Lcom/flyersoft/staticlayout/MyLayout;->mText:Ljava/lang/CharSequence;

    const/4 v13, 0x0

    invoke-static/range {v7 .. v15}, Lcom/flyersoft/staticlayout/MyLayout;->measureText(Lcom/flyersoft/staticlayout/MRTextView;Landroid/text/TextPaint;Landroid/text/TextPaint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;Z[Ljava/lang/Object;)F

    move-result v5

    sub-float/2addr v2, v5

    goto :goto_1

    .line 601
    :cond_1
    iget-object v7, v0, Lcom/flyersoft/staticlayout/MyLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    iget-object v8, v0, Lcom/flyersoft/staticlayout/MyLayout;->mPaint:Landroid/text/TextPaint;

    iget-object v9, v0, Lcom/flyersoft/staticlayout/MyLayout;->mWorkPaint:Landroid/text/TextPaint;

    iget-object v10, v0, Lcom/flyersoft/staticlayout/MyLayout;->mText:Ljava/lang/CharSequence;

    const/4 v13, 0x0

    move/from16 v12, p1

    invoke-static/range {v7 .. v15}, Lcom/flyersoft/staticlayout/MyLayout;->measureText(Lcom/flyersoft/staticlayout/MRTextView;Landroid/text/TextPaint;Landroid/text/TextPaint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;Z[Ljava/lang/Object;)F

    move-result v5

    add-float/2addr v2, v5

    .line 605
    :cond_2
    :goto_1
    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getParagraphAlignment(I)Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    move-result-object v5

    .line 606
    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getParagraphLeft(I)I

    move-result v6

    .line 607
    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getParagraphRight(I)I

    move-result v7

    .line 609
    invoke-static {v5}, Lcom/flyersoft/staticlayout/MyLayout;->alignNormal(Lcom/flyersoft/staticlayout/MyLayout$Alignment;)Z

    move-result v8

    if-eqz v8, :cond_4

    if-ne v3, v4, :cond_3

    :goto_2
    int-to-float v1, v7

    :goto_3
    add-float/2addr v1, v2

    return v1

    :cond_3
    :goto_4
    int-to-float v1, v6

    goto :goto_3

    .line 616
    :cond_4
    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineMax(I)F

    move-result v1

    .line 618
    sget-object v8, Lcom/flyersoft/staticlayout/MyLayout$Alignment;->ALIGN_RIGHT:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    if-ne v5, v8, :cond_6

    if-ne v3, v4, :cond_5

    int-to-float v3, v6

    add-float/2addr v3, v1

    :goto_5
    add-float/2addr v3, v2

    return v3

    :cond_5
    int-to-float v3, v7

    sub-float/2addr v3, v1

    goto :goto_5

    :cond_6
    float-to-int v1, v1

    and-int/lit8 v1, v1, -0x2

    if-ne v3, v4, :cond_7

    sub-int v3, v7, v6

    sub-int/2addr v3, v1

    .line 627
    div-int/lit8 v3, v3, 0x2

    sub-int/2addr v7, v3

    goto :goto_2

    :cond_7
    sub-int/2addr v7, v6

    sub-int/2addr v7, v1

    .line 629
    div-int/lit8 v7, v7, 0x2

    add-int/2addr v6, v7

    goto :goto_4
.end method

.method private getLineMax(I[Ljava/lang/Object;Z)F
    .locals 9

    .line 704
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v4

    if-eqz p3, :cond_0

    .line 708
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineEnd(I)I

    move-result p3

    goto :goto_0

    .line 710
    :cond_0
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineVisibleEnd(I)I

    move-result p3

    :goto_0
    move v5, p3

    .line 712
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineContainsTab(I)Z

    move-result v7

    if-nez p2, :cond_1

    if-eqz v7, :cond_1

    .line 714
    iget-object p3, p0, Lcom/flyersoft/staticlayout/MyLayout;->mText:Ljava/lang/CharSequence;

    instance-of p3, p3, Landroid/text/Spanned;

    if-eqz p3, :cond_1

    .line 715
    iget-object p2, p0, Lcom/flyersoft/staticlayout/MyLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p2, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineSpans(I)[Ljava/lang/Object;

    move-result-object p1

    const-class p2, Landroid/text/style/TabStopSpan;

    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->getSpans([Ljava/lang/Object;Ljava/lang/Class;)[Ljava/lang/Object;

    move-result-object p2

    :cond_1
    move-object v8, p2

    .line 718
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    iget-object v1, p0, Lcom/flyersoft/staticlayout/MyLayout;->mPaint:Landroid/text/TextPaint;

    iget-object v2, p0, Lcom/flyersoft/staticlayout/MyLayout;->mWorkPaint:Landroid/text/TextPaint;

    iget-object v3, p0, Lcom/flyersoft/staticlayout/MyLayout;->mText:Ljava/lang/CharSequence;

    const/4 v6, 0x0

    invoke-static/range {v0 .. v8}, Lcom/flyersoft/staticlayout/MyLayout;->measureText(Lcom/flyersoft/staticlayout/MRTextView;Landroid/text/TextPaint;Landroid/text/TextPaint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;Z[Ljava/lang/Object;)F

    move-result p1

    return p1
.end method

.method private getLineVisibleEnd(III)I
    .locals 3

    .line 864
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->mText:Ljava/lang/CharSequence;

    .line 866
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-le p3, v1, :cond_0

    .line 867
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result p1

    return p1

    .line 868
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyLayout;->getLineCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ne p1, v1, :cond_1

    return p3

    :cond_1
    :goto_0
    if-le p3, p2, :cond_5

    if-nez v0, :cond_2

    goto :goto_1

    :cond_2
    add-int/lit8 p1, p3, -0x1

    .line 874
    invoke-interface {v0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    const/16 v2, 0xa

    if-ne v1, v2, :cond_3

    return p1

    :cond_3
    const/16 p1, 0x20

    if-eq v1, p1, :cond_4

    const/16 p1, 0x9

    if-eq v1, p1, :cond_4

    goto :goto_1

    :cond_4
    add-int/lit8 p3, p3, -0x1

    goto :goto_0

    :cond_5
    :goto_1
    return p3
.end method

.method private getOffsetAtStartOf(I)I
    .locals 5

    const/4 v0, 0x0

    if-eqz p1, :cond_4

    .line 912
    iget-object v1, p0, Lcom/flyersoft/staticlayout/MyLayout;->mText:Ljava/lang/CharSequence;

    if-nez v1, :cond_0

    goto :goto_1

    .line 916
    :cond_0
    invoke-interface {v1, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    const v3, 0xdc00

    if-lt v2, v3, :cond_1

    const v3, 0xdfff

    if-gt v2, v3, :cond_1

    add-int/lit8 v2, p1, -0x1

    .line 919
    invoke-interface {v1, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    const v3, 0xd800

    if-lt v2, v3, :cond_1

    const v3, 0xdbff

    if-gt v2, v3, :cond_1

    add-int/lit8 p1, p1, -0x1

    .line 925
    :cond_1
    iget-boolean v2, p0, Lcom/flyersoft/staticlayout/MyLayout;->mSpannedText:Z

    if-eqz v2, :cond_3

    .line 926
    check-cast v1, Landroid/text/Spanned;

    const-class v2, Lcom/flyersoft/staticlayout/ReplacementSpan;

    invoke-interface {v1, p1, p1, v2}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/flyersoft/staticlayout/ReplacementSpan;

    .line 929
    :goto_0
    array-length v3, v2

    if-ge v0, v3, :cond_3

    .line 930
    aget-object v3, v2, v0

    invoke-interface {v1, v3}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v3

    .line 931
    aget-object v4, v2, v0

    invoke-interface {v1, v4}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v4

    if-ge v3, p1, :cond_2

    if-le v4, p1, :cond_2

    move p1, v3

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    return p1

    :cond_4
    :goto_1
    return v0
.end method

.method private static measureText(Lcom/flyersoft/staticlayout/MRTextView;Landroid/text/TextPaint;Landroid/text/TextPaint;Ljava/lang/CharSequence;IIIILcom/flyersoft/staticlayout/MyLayout$Directions;ZZZ[Ljava/lang/Object;)F
    .locals 19

    move-object/from16 v3, p3

    move/from16 v7, p4

    move/from16 v0, p5

    move/from16 v8, p6

    move/from16 v9, p7

    const/4 v10, 0x0

    if-eqz p11, :cond_0

    sub-int v1, v8, v7

    .line 1076
    invoke-static {v1}, Lcom/flyersoft/staticlayout/TextUtils;->obtain(I)[C

    move-result-object v1

    .line 1077
    invoke-static {v3, v7, v8, v1, v10}, Lcom/flyersoft/staticlayout/TextUtils;->getChars(Ljava/lang/CharSequence;II[CI)V

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    move-object v11, v1

    const/4 v12, -0x1

    if-eqz p10, :cond_1

    if-ne v9, v12, :cond_1

    xor-int/lit8 v1, p9, 0x1

    goto :goto_1

    :cond_1
    move/from16 v1, p9

    :goto_1
    const/4 v2, 0x0

    if-eqz p8, :cond_13

    .line 1087
    invoke-static/range {p8 .. p8}, Lcom/flyersoft/staticlayout/MyLayout$Directions;->-$$Nest$fgetmDirections(Lcom/flyersoft/staticlayout/MyLayout$Directions;)[S

    move-result-object v4

    if-eqz v4, :cond_13

    const/4 v4, 0x0

    const/4 v13, 0x0

    .line 1088
    :goto_2
    invoke-static/range {p8 .. p8}, Lcom/flyersoft/staticlayout/MyLayout$Directions;->-$$Nest$fgetmDirections(Lcom/flyersoft/staticlayout/MyLayout$Directions;)[S

    move-result-object v5

    array-length v5, v5

    if-ge v13, v5, :cond_13

    if-eqz p10, :cond_2

    xor-int/lit8 v1, v1, 0x1

    :cond_2
    move v14, v1

    .line 1092
    invoke-static/range {p8 .. p8}, Lcom/flyersoft/staticlayout/MyLayout$Directions;->-$$Nest$fgetmDirections(Lcom/flyersoft/staticlayout/MyLayout$Directions;)[S

    move-result-object v1

    aget-short v1, v1, v13

    add-int/2addr v1, v4

    sub-int v5, v8, v7

    if-le v1, v5, :cond_3

    move v15, v5

    goto :goto_3

    :cond_3
    move v15, v1

    :goto_3
    if-eqz p11, :cond_4

    move v1, v4

    goto :goto_4

    :cond_4
    move v1, v15

    :goto_4
    move/from16 v16, v2

    :goto_5
    if-gt v1, v15, :cond_12

    if-eqz p11, :cond_5

    if-ge v1, v15, :cond_5

    .line 1102
    aget-char v2, v11, v1

    goto :goto_6

    :cond_5
    const/4 v2, 0x0

    :goto_6
    const v5, 0xd800

    if-lt v2, v5, :cond_6

    const v5, 0xdfff

    if-gt v2, v5, :cond_6

    add-int/lit8 v5, v1, 0x1

    if-ge v5, v15, :cond_6

    .line 1106
    invoke-static {v11, v1}, Ljava/lang/Character;->codePointAt([CI)I

    move-result v2

    .line 1108
    sget v5, Lcom/flyersoft/staticlayout/MyLayout;->MIN_EMOJI:I

    if-lt v2, v5, :cond_6

    sget v5, Lcom/flyersoft/staticlayout/MyLayout;->MAX_EMOJI:I

    :cond_6
    const/16 v5, 0x9

    if-eq v1, v15, :cond_7

    if-eq v2, v5, :cond_7

    move-object/from16 v5, p12

    move v10, v0

    const/4 v0, -0x1

    goto/16 :goto_b

    :cond_7
    const/16 v2, 0x9

    add-int v5, v7, v1

    const/4 v6, 0x1

    if-lt v0, v5, :cond_8

    if-eqz v14, :cond_a

    if-gt v0, v5, :cond_a

    :cond_8
    if-ne v9, v6, :cond_9

    and-int/lit8 v17, v13, 0x1

    if-nez v17, :cond_9

    add-int v1, v7, v4

    const/4 v2, 0x0

    move-object/from16 p6, p0

    move-object/from16 p7, p1

    move-object/from16 p8, p2

    move/from16 p11, v0

    move/from16 p10, v1

    move-object/from16 p12, v2

    move-object/from16 p9, v3

    .line 1120
    invoke-static/range {p6 .. p12}, Lcom/flyersoft/staticlayout/Styled;->measureText(Lcom/flyersoft/staticlayout/MRTextView;Landroid/text/TextPaint;Landroid/text/TextPaint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)F

    move-result v0

    add-float v16, v16, v0

    return v16

    :cond_9
    if-ne v9, v12, :cond_a

    and-int/lit8 v0, v13, 0x1

    if-eqz v0, :cond_a

    add-int v0, v7, v4

    const/4 v1, 0x0

    move-object/from16 p6, p0

    move-object/from16 p7, p1

    move-object/from16 p8, p2

    move-object/from16 p9, p3

    move/from16 p11, p5

    move/from16 p10, v0

    move-object/from16 p12, v1

    .line 1127
    invoke-static/range {p6 .. p12}, Lcom/flyersoft/staticlayout/Styled;->measureText(Lcom/flyersoft/staticlayout/MRTextView;Landroid/text/TextPaint;Landroid/text/TextPaint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)F

    move-result v0

    sub-float v16, v16, v0

    return v16

    :cond_a
    add-int/2addr v4, v7

    const/4 v0, 0x1

    const/4 v6, 0x0

    move-object/from16 v0, p0

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move/from16 v10, p5

    move/from16 v18, v1

    const/4 v12, 0x1

    move-object/from16 v1, p1

    .line 1134
    invoke-static/range {v0 .. v6}, Lcom/flyersoft/staticlayout/Styled;->measureText(Lcom/flyersoft/staticlayout/MRTextView;Landroid/text/TextPaint;Landroid/text/TextPaint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)F

    move-result v6

    if-lt v10, v5, :cond_c

    if-eqz v14, :cond_b

    if-gt v10, v5, :cond_b

    goto :goto_7

    :cond_b
    move-object/from16 v3, p3

    const/4 v0, -0x1

    goto :goto_8

    :cond_c
    :goto_7
    if-ne v9, v12, :cond_d

    const/4 v0, 0x0

    move-object/from16 p6, p0

    move-object/from16 p7, p1

    move-object/from16 p8, p2

    move-object/from16 p9, p3

    move-object/from16 p12, v0

    move/from16 p10, v4

    move/from16 p11, v10

    .line 1141
    invoke-static/range {p6 .. p12}, Lcom/flyersoft/staticlayout/Styled;->measureText(Lcom/flyersoft/staticlayout/MRTextView;Landroid/text/TextPaint;Landroid/text/TextPaint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)F

    move-result v0

    sub-float/2addr v6, v0

    add-float v16, v16, v6

    return v16

    :cond_d
    const/4 v0, -0x1

    if-ne v9, v0, :cond_e

    const/4 v0, 0x0

    move-object/from16 p6, p0

    move-object/from16 p7, p1

    move-object/from16 p8, p2

    move-object/from16 p9, p3

    move/from16 p11, p5

    move-object/from16 p12, v0

    move/from16 p10, v4

    .line 1149
    invoke-static/range {p6 .. p12}, Lcom/flyersoft/staticlayout/Styled;->measureText(Lcom/flyersoft/staticlayout/MRTextView;Landroid/text/TextPaint;Landroid/text/TextPaint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)F

    move-result v0

    sub-float/2addr v6, v0

    sub-float v16, v16, v6

    return v16

    :cond_e
    move-object/from16 v3, p3

    move/from16 v10, p5

    :goto_8
    if-ne v9, v0, :cond_f

    sub-float v16, v16, v6

    goto :goto_9

    :cond_f
    add-float v16, v16, v6

    :goto_9
    move/from16 v1, v18

    if-eq v1, v15, :cond_11

    .line 1162
    aget-char v2, v11, v1

    const/16 v4, 0x9

    if-ne v2, v4, :cond_11

    if-ne v10, v5, :cond_10

    return v16

    :cond_10
    int-to-float v2, v9

    mul-float v4, v16, v2

    move-object/from16 v5, p12

    .line 1166
    invoke-static {v3, v7, v8, v4, v5}, Lcom/flyersoft/staticlayout/MyLayout;->nextTab(Ljava/lang/CharSequence;IIF[Ljava/lang/Object;)F

    move-result v4

    mul-float v16, v2, v4

    goto :goto_a

    :cond_11
    move-object/from16 v5, p12

    :goto_a
    add-int/lit8 v2, v1, 0x1

    move v4, v2

    :goto_b
    add-int/lit8 v1, v1, 0x1

    move v0, v10

    const/4 v10, 0x0

    const/4 v12, -0x1

    goto/16 :goto_5

    :cond_12
    move-object/from16 v5, p12

    move v10, v0

    const/4 v0, -0x1

    add-int/lit8 v13, v13, 0x1

    move v0, v10

    move v1, v14

    move v4, v15

    move/from16 v2, v16

    const/4 v10, 0x0

    const/4 v12, -0x1

    goto/16 :goto_2

    :cond_13
    if-eqz p11, :cond_14

    .line 1194
    invoke-static {v11}, Lcom/flyersoft/staticlayout/TextUtils;->recycle([C)V

    :cond_14
    return v2
.end method

.method static measureText(Lcom/flyersoft/staticlayout/MRTextView;Landroid/text/TextPaint;Landroid/text/TextPaint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;Z[Ljava/lang/Object;)F
    .locals 17

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move/from16 v7, p4

    move/from16 v8, p5

    move-object/from16 v6, p6

    const/4 v9, 0x0

    if-eqz p7, :cond_0

    sub-int v0, v8, v7

    .line 1208
    invoke-static {v0}, Lcom/flyersoft/staticlayout/TextUtils;->obtain(I)[C

    move-result-object v0

    .line 1209
    invoke-static {v3, v7, v8, v0, v9}, Lcom/flyersoft/staticlayout/TextUtils;->getChars(Ljava/lang/CharSequence;II[CI)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    move-object v10, v0

    sub-int v11, v8, v7

    if-eqz v6, :cond_1

    .line 1220
    iput v9, v6, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    .line 1221
    iput v9, v6, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    :cond_1
    if-eqz p7, :cond_2

    const/4 v0, 0x0

    goto :goto_1

    :cond_2
    move v0, v11

    :goto_1
    const/4 v1, 0x0

    move v12, v0

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v4, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    :goto_2
    if-gt v12, v11, :cond_d

    if-eqz p7, :cond_3

    if-ge v12, v11, :cond_3

    .line 1229
    aget-char v5, v10, v12

    goto :goto_3

    :cond_3
    const/4 v5, 0x0

    :goto_3
    const v9, 0xd800

    if-lt v5, v9, :cond_4

    const v9, 0xdfff

    if-gt v5, v9, :cond_4

    if-ge v12, v11, :cond_4

    .line 1233
    invoke-static {v10, v12}, Ljava/lang/Character;->codePointAt([CI)I

    move-result v5

    .line 1235
    sget v9, Lcom/flyersoft/staticlayout/MyLayout;->MIN_EMOJI:I

    if-lt v5, v9, :cond_4

    sget v9, Lcom/flyersoft/staticlayout/MyLayout;->MAX_EMOJI:I

    :cond_4
    if-eq v12, v11, :cond_5

    const/16 v9, 0x9

    if-eq v5, v9, :cond_5

    move v9, v0

    move-object/from16 v16, v10

    move-object/from16 v0, p8

    goto :goto_6

    :cond_5
    const/4 v9, 0x0

    .line 1242
    iput v9, v2, Landroid/text/TextPaint;->baselineShift:I

    add-int/2addr v4, v7

    add-int v5, v7, v12

    move v9, v0

    move-object/from16 v16, v10

    move-object/from16 v0, p0

    move v10, v1

    move-object/from16 v1, p1

    .line 1245
    invoke-static/range {v0 .. v6}, Lcom/flyersoft/staticlayout/Styled;->measureText(Lcom/flyersoft/staticlayout/MRTextView;Landroid/text/TextPaint;Landroid/text/TextPaint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)F

    move-result v4

    add-float/2addr v13, v4

    if-eqz v6, :cond_7

    .line 1250
    iget v0, v2, Landroid/text/TextPaint;->baselineShift:I

    if-gez v0, :cond_6

    .line 1251
    iget v0, v6, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    iget v1, v2, Landroid/text/TextPaint;->baselineShift:I

    add-int/2addr v0, v1

    iput v0, v6, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    .line 1252
    iget v0, v6, Landroid/graphics/Paint$FontMetricsInt;->top:I

    iget v1, v2, Landroid/text/TextPaint;->baselineShift:I

    add-int/2addr v0, v1

    iput v0, v6, Landroid/graphics/Paint$FontMetricsInt;->top:I

    goto :goto_4

    .line 1254
    :cond_6
    iget v0, v6, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    iget v1, v2, Landroid/text/TextPaint;->baselineShift:I

    add-int/2addr v0, v1

    iput v0, v6, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 1255
    iget v0, v6, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    iget v1, v2, Landroid/text/TextPaint;->baselineShift:I

    add-int/2addr v0, v1

    iput v0, v6, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    :cond_7
    :goto_4
    move-object/from16 v0, p8

    if-eq v12, v11, :cond_8

    .line 1261
    invoke-static {v3, v7, v8, v13, v0}, Lcom/flyersoft/staticlayout/MyLayout;->nextTab(Ljava/lang/CharSequence;IIF[Ljava/lang/Object;)F

    move-result v13

    :cond_8
    if-eqz v6, :cond_c

    .line 1276
    iget v1, v6, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    if-ge v1, v14, :cond_9

    .line 1277
    iget v14, v6, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    .line 1279
    :cond_9
    iget v1, v6, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    if-le v1, v15, :cond_a

    .line 1280
    iget v15, v6, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 1283
    :cond_a
    iget v1, v6, Landroid/graphics/Paint$FontMetricsInt;->top:I

    if-ge v1, v9, :cond_b

    .line 1284
    iget v1, v6, Landroid/graphics/Paint$FontMetricsInt;->top:I

    move v9, v1

    .line 1286
    :cond_b
    iget v1, v6, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    if-le v1, v10, :cond_c

    .line 1287
    iget v1, v6, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    goto :goto_5

    :cond_c
    move v1, v10

    :goto_5
    add-int/lit8 v4, v12, 0x1

    :goto_6
    add-int/lit8 v12, v12, 0x1

    move v0, v9

    move-object/from16 v10, v16

    const/4 v9, 0x0

    goto/16 :goto_2

    :cond_d
    move v9, v0

    move-object/from16 v16, v10

    move v10, v1

    if-eqz v6, :cond_e

    .line 1301
    iput v14, v6, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    .line 1302
    iput v15, v6, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 1303
    iput v9, v6, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 1304
    iput v10, v6, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    :cond_e
    if-eqz p7, :cond_f

    .line 1308
    invoke-static/range {v16 .. v16}, Lcom/flyersoft/staticlayout/TextUtils;->recycle([C)V

    :cond_f
    return v13
.end method

.method static nextTab(Ljava/lang/CharSequence;IIF[Ljava/lang/Object;)F
    .locals 3

    .line 1318
    instance-of v0, p0, Landroid/text/Spanned;

    if-eqz v0, :cond_4

    const/4 v0, 0x0

    if-nez p4, :cond_0

    .line 1320
    check-cast p0, Landroid/text/Spanned;

    const-class p4, Landroid/text/style/TabStopSpan;

    invoke-interface {p0, p1, p2, p4}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p4

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    const p1, 0x7f7fffff    # Float.MAX_VALUE

    const p2, 0x7f7fffff    # Float.MAX_VALUE

    .line 1324
    :goto_1
    array-length v1, p4

    if-ge v0, v1, :cond_3

    if-nez p0, :cond_1

    .line 1326
    aget-object v1, p4, v0

    instance-of v1, v1, Landroid/text/style/TabStopSpan;

    if-nez v1, :cond_1

    goto :goto_2

    .line 1330
    :cond_1
    aget-object v1, p4, v0

    check-cast v1, Landroid/text/style/TabStopSpan;

    invoke-interface {v1}, Landroid/text/style/TabStopSpan;->getTabStop()I

    move-result v1

    int-to-float v1, v1

    cmpg-float v2, v1, p2

    if-gez v2, :cond_2

    cmpl-float v2, v1, p3

    if-lez v2, :cond_2

    move p2, v1

    :cond_2
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    cmpl-float p0, p2, p1

    if-eqz p0, :cond_4

    return p2

    :cond_4
    const/high16 p0, 0x41a00000    # 20.0f

    add-float/2addr p3, p0

    div-float/2addr p3, p0

    float-to-int p0, p3

    mul-int/lit8 p0, p0, 0x14

    int-to-float p0, p0

    return p0
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 216
    invoke-virtual {p0, p1, v0, v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->draw(Landroid/graphics/Canvas;Landroid/graphics/Path;Landroid/graphics/Paint;I)V

    return-void
.end method

.method public draw(Landroid/graphics/Canvas;Landroid/graphics/Path;Landroid/graphics/Paint;I)V
    .locals 26

    move-object/from16 v0, p0

    .line 225
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getScrollView()Landroid/view/View;

    move-result-object v1

    .line 226
    invoke-virtual {v1}, Landroid/view/View;->getScrollY()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForVertical(I)I

    move-result v2

    .line 227
    invoke-virtual {v1}, Landroid/view/View;->getScrollY()I

    move-result v1

    iget-object v3, v0, Lcom/flyersoft/staticlayout/MyLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v3}, Lcom/flyersoft/staticlayout/MRTextView;->getTxtHeight()I

    move-result v3

    add-int/2addr v1, v3

    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForVertical(I)I

    move-result v15

    .line 229
    invoke-virtual {v0, v2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTop(I)I

    move-result v1

    .line 230
    invoke-virtual {v0, v2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v3

    .line 232
    const-class v4, Landroid/text/style/ParagraphStyle;

    invoke-static {v4}, Lcom/flyersoft/staticlayout/ArrayUtils;->emptyArray(Ljava/lang/Class;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Landroid/text/style/ParagraphStyle;

    .line 234
    iget-object v5, v0, Lcom/flyersoft/staticlayout/MyLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v5}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth()I

    move-result v5

    int-to-float v5, v5

    const v6, 0x3f266666    # 0.65f

    mul-float v5, v5, v6

    float-to-int v5, v5

    .line 237
    iget-object v6, v0, Lcom/flyersoft/staticlayout/MyLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    iget-boolean v6, v6, Lcom/flyersoft/staticlayout/MRTextView;->drawMarginBackgroundOnly:Z

    const/16 v16, 0x0

    if-eqz v6, :cond_6

    move-object/from16 v13, v16

    :goto_0
    if-gt v2, v15, :cond_5

    add-int/lit8 v4, v2, 0x1

    .line 241
    invoke-virtual {v0, v4}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v5

    .line 242
    invoke-direct {v0, v2, v3, v5}, Lcom/flyersoft/staticlayout/MyLayout;->getLineVisibleEnd(III)I

    move-result v6

    .line 245
    invoke-virtual {v0, v4}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTop(I)I

    move-result v9

    .line 247
    invoke-virtual {v0, v2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineDescent(I)I

    move-result v10

    sub-int v10, v9, v10

    .line 249
    iget-object v11, v0, Lcom/flyersoft/staticlayout/MyLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v11, v2}, Lcom/flyersoft/staticlayout/MRTextView;->removeLineSpans(I)V

    .line 250
    iget-object v11, v0, Lcom/flyersoft/staticlayout/MyLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v11, v2}, Lcom/flyersoft/staticlayout/MRTextView;->getLineSpans(I)[Ljava/lang/Object;

    move-result-object v11

    const-class v12, Landroid/text/style/ParagraphStyle;

    invoke-static {v11, v12}, Lcom/flyersoft/tools/T;->getSpans([Ljava/lang/Object;Ljava/lang/Class;)[Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [Landroid/text/style/ParagraphStyle;

    .line 252
    array-length v12, v11

    const/4 v14, 0x0

    :goto_1
    if-ge v14, v12, :cond_2

    .line 254
    aget-object v7, v11, v14

    const/16 p3, 0x1

    instance-of v8, v7, Lcom/flyersoft/staticlayout/MyMarginSpan;

    if-eqz v8, :cond_1

    .line 255
    check-cast v7, Lcom/flyersoft/staticlayout/MyMarginSpan;

    .line 258
    iput v9, v7, Lcom/flyersoft/staticlayout/MyMarginSpan;->bottom:I

    .line 259
    iput v6, v7, Lcom/flyersoft/staticlayout/MyMarginSpan;->end:I

    .line 260
    iput v2, v7, Lcom/flyersoft/staticlayout/MyMarginSpan;->endLine:I

    if-nez v13, :cond_0

    .line 262
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 263
    :cond_0
    invoke-virtual {v13, v7}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 264
    iput v1, v7, Lcom/flyersoft/staticlayout/MyMarginSpan;->top:I

    .line 265
    iput v3, v7, Lcom/flyersoft/staticlayout/MyMarginSpan;->start:I

    .line 266
    iput v2, v7, Lcom/flyersoft/staticlayout/MyMarginSpan;->startLine:I

    .line 267
    iput v10, v7, Lcom/flyersoft/staticlayout/MyMarginSpan;->baseline:I

    .line 268
    invoke-virtual {v13, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    add-int/lit8 v14, v14, 0x1

    goto :goto_1

    :cond_2
    const/16 p3, 0x1

    .line 273
    invoke-virtual {v0, v2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineFloat(I)I

    move-result v1

    if-eqz v1, :cond_4

    .line 274
    invoke-virtual {v0, v2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineFloatSp(I)Lcom/flyersoft/staticlayout/MyFloatSpan;

    move-result-object v1

    if-nez v13, :cond_3

    .line 276
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    :cond_3
    if-eqz v1, :cond_4

    .line 277
    invoke-virtual {v13, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 278
    invoke-virtual {v13, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_4
    move v2, v4

    move v3, v5

    move v1, v9

    goto :goto_0

    :cond_5
    const/16 p3, 0x1

    if-eqz v13, :cond_23

    .line 283
    invoke-static {v13}, Lcom/flyersoft/staticlayout/MyMarginSpan;->sortDrawMargins(Ljava/util/ArrayList;)V

    .line 284
    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    move v14, v1

    :goto_2
    if-ltz v14, :cond_23

    .line 285
    invoke-virtual {v13, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Lcom/flyersoft/staticlayout/MyMarginSpan;

    iget-object v11, v0, Lcom/flyersoft/staticlayout/MyLayout;->mPaint:Landroid/text/TextPaint;

    iget-object v12, v0, Lcom/flyersoft/staticlayout/MyLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    move-object/from16 v10, p1

    invoke-virtual/range {v9 .. v14}, Lcom/flyersoft/staticlayout/MyMarginSpan;->drawFrameMargin(Landroid/graphics/Canvas;Landroid/text/TextPaint;Lcom/flyersoft/staticlayout/MRTextView;Ljava/util/ArrayList;I)V

    add-int/lit8 v14, v14, -0x1

    goto :goto_2

    :cond_6
    const/16 p3, 0x1

    .line 290
    iget-object v6, v0, Lcom/flyersoft/staticlayout/MyLayout;->mAlignment:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    move v8, v1

    :goto_3
    if-gt v2, v15, :cond_23

    add-int/lit8 v1, v2, 0x1

    .line 293
    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v7

    .line 294
    invoke-direct {v0, v2, v3, v7}, Lcom/flyersoft/staticlayout/MyLayout;->getLineVisibleEnd(III)I

    move-result v20

    .line 297
    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTop(I)I

    move-result v10

    .line 299
    invoke-virtual {v0, v2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineDescent(I)I

    move-result v9

    sub-int v9, v10, v9

    if-eqz v3, :cond_8

    .line 301
    iget-object v11, v0, Lcom/flyersoft/staticlayout/MyLayout;->mText:Ljava/lang/CharSequence;

    add-int/lit8 v12, v3, -0x1

    invoke-interface {v11, v12}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v11

    const/16 v12, 0xa

    if-ne v11, v12, :cond_7

    goto :goto_4

    :cond_7
    const/4 v11, 0x0

    goto :goto_5

    :cond_8
    :goto_4
    const/4 v11, 0x1

    .line 303
    :goto_5
    iget-boolean v12, v0, Lcom/flyersoft/staticlayout/MyLayout;->mSpannedText:Z

    if-eqz v12, :cond_e

    .line 304
    iget-object v4, v0, Lcom/flyersoft/staticlayout/MyLayout;->mText:Ljava/lang/CharSequence;

    check-cast v4, Landroid/text/Spanned;

    .line 305
    iget-object v6, v0, Lcom/flyersoft/staticlayout/MyLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v6, v2}, Lcom/flyersoft/staticlayout/MRTextView;->getLineSpans(I)[Ljava/lang/Object;

    move-result-object v6

    const-class v12, Landroid/text/style/ParagraphStyle;

    invoke-static {v6, v12}, Lcom/flyersoft/tools/T;->getSpans([Ljava/lang/Object;Ljava/lang/Class;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Landroid/text/style/ParagraphStyle;

    .line 306
    iget-object v12, v0, Lcom/flyersoft/staticlayout/MyLayout;->mAlignment:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    move/from16 p4, v1

    move-object/from16 v14, v16

    if-eqz v6, :cond_c

    move-object/from16 v17, v14

    const/4 v13, 0x0

    .line 311
    :goto_6
    array-length v1, v6

    if-ge v13, v1, :cond_c

    .line 312
    aget-object v1, v6, v13

    move/from16 v19, v3

    instance-of v3, v1, Lcom/flyersoft/staticlayout/AlignmentSpan;

    if-eqz v3, :cond_b

    .line 313
    check-cast v1, Lcom/flyersoft/staticlayout/AlignmentSpan;

    if-nez v14, :cond_9

    move-object v14, v1

    goto :goto_7

    :cond_9
    if-nez v17, :cond_a

    .line 318
    invoke-interface {v4, v14}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v3

    sub-int v3, v19, v3

    invoke-interface {v4, v14}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v17

    sub-int v17, v17, v20

    add-int v3, v3, v17

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    .line 319
    :cond_a
    invoke-interface {v4, v1}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v3

    sub-int v3, v19, v3

    invoke-interface {v4, v1}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v18

    sub-int v18, v18, v20

    add-int v3, v3, v18

    move-object/from16 v18, v1

    .line 320
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ge v3, v1, :cond_b

    .line 322
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    move-object/from16 v14, v18

    :cond_b
    :goto_7
    add-int/lit8 v13, v13, 0x1

    move/from16 v3, v19

    goto :goto_6

    :cond_c
    move/from16 v19, v3

    if-eqz v14, :cond_d

    .line 328
    invoke-interface {v14}, Lcom/flyersoft/staticlayout/AlignmentSpan;->getAlignment()Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    move-result-object v1

    move-object v14, v6

    goto :goto_8

    :cond_d
    move-object v14, v6

    move-object v1, v12

    goto :goto_8

    :cond_e
    move/from16 p4, v1

    move/from16 v19, v3

    move-object v14, v4

    move-object v1, v6

    .line 331
    :goto_8
    invoke-virtual {v0, v2}, Lcom/flyersoft/staticlayout/MyLayout;->getParagraphDirection(I)I

    move-result v3

    .line 333
    iget v4, v0, Lcom/flyersoft/staticlayout/MyLayout;->mWidth:I

    .line 338
    iget-boolean v6, v0, Lcom/flyersoft/staticlayout/MyLayout;->mSpannedText:Z

    if-eqz v6, :cond_19

    .line 339
    array-length v6, v14

    move/from16 v17, v4

    move/from16 v24, v7

    move-object/from16 v7, v16

    const/4 v4, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/16 v18, 0x0

    :goto_9
    if-ge v13, v6, :cond_16

    move/from16 v21, v6

    .line 341
    aget-object v6, v14, v13

    move/from16 v22, v8

    instance-of v8, v6, Lcom/flyersoft/staticlayout/MyMarginSpan;

    if-eqz v8, :cond_14

    .line 342
    check-cast v6, Lcom/flyersoft/staticlayout/MyMarginSpan;

    int-to-float v4, v4

    .line 343
    iget v8, v6, Lcom/flyersoft/staticlayout/MyMarginSpan;->leftMargin:F

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v23

    mul-float v8, v8, v23

    add-float/2addr v4, v8

    float-to-int v4, v4

    if-eqz v11, :cond_10

    .line 345
    iget v8, v6, Lcom/flyersoft/staticlayout/MyMarginSpan;->indent:F

    const/16 v23, 0x0

    cmpl-float v8, v8, v23

    if-eqz v8, :cond_10

    if-eqz v7, :cond_f

    iget v8, v6, Lcom/flyersoft/staticlayout/MyMarginSpan;->spStart:I

    move/from16 v25, v10

    iget v10, v7, Lcom/flyersoft/staticlayout/MyMarginSpan;->spStart:I

    if-le v8, v10, :cond_11

    goto :goto_a

    :cond_f
    move/from16 v25, v10

    .line 347
    :goto_a
    iget v7, v6, Lcom/flyersoft/staticlayout/MyMarginSpan;->indent:F

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM2()F

    move-result v8

    mul-float v7, v7, v8

    float-to-int v7, v7

    move/from16 v18, v7

    move-object v7, v6

    goto :goto_b

    :cond_10
    move/from16 v25, v10

    :cond_11
    :goto_b
    if-le v4, v5, :cond_12

    move v4, v5

    .line 353
    :cond_12
    iget-boolean v6, v6, Lcom/flyersoft/staticlayout/MyMarginSpan;->noindent:Z

    if-nez v6, :cond_13

    aget-object v6, v14, v13

    instance-of v6, v6, Lcom/flyersoft/staticlayout/MyBulletSpan;

    if-eqz v6, :cond_15

    :cond_13
    const/4 v12, 0x1

    goto :goto_c

    :cond_14
    move/from16 v25, v10

    :cond_15
    :goto_c
    add-int/lit8 v13, v13, 0x1

    move/from16 v6, v21

    move/from16 v8, v22

    move/from16 v10, v25

    goto :goto_9

    :cond_16
    move/from16 v22, v8

    move/from16 v25, v10

    add-int v4, v4, v18

    .line 360
    invoke-virtual {v0, v2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineFloat(I)I

    move-result v6

    if-lez v6, :cond_17

    add-int/2addr v4, v6

    :cond_17
    if-le v4, v5, :cond_18

    move v4, v5

    :cond_18
    if-gez v4, :cond_1a

    const/4 v4, 0x0

    goto :goto_d

    :cond_19
    move/from16 v17, v4

    move/from16 v24, v7

    move/from16 v22, v8

    move/from16 v25, v10

    const/4 v4, 0x0

    const/4 v12, 0x0

    :cond_1a
    :goto_d
    if-eqz v11, :cond_1b

    .line 370
    sget-boolean v6, Lcom/flyersoft/tools/A;->indentParagraph:Z

    if-eqz v6, :cond_1b

    if-nez v12, :cond_1b

    int-to-float v4, v4

    .line 371
    iget-object v6, v0, Lcom/flyersoft/staticlayout/MyLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v6}, Lcom/flyersoft/staticlayout/MRTextView;->indentWidth()F

    move-result v6

    add-float/2addr v4, v6

    float-to-int v4, v4

    .line 374
    :cond_1b
    invoke-static {v1}, Lcom/flyersoft/staticlayout/MyLayout;->alignNormal(Lcom/flyersoft/staticlayout/MyLayout$Alignment;)Z

    move-result v6

    if-eqz v6, :cond_1d

    const/4 v6, 0x1

    if-ne v3, v6, :cond_1c

    goto :goto_e

    :cond_1c
    move/from16 v4, v17

    :goto_e
    const/4 v7, 0x1

    :goto_f
    const/4 v8, 0x0

    goto :goto_11

    :cond_1d
    const/4 v6, 0x0

    .line 381
    invoke-direct {v0, v2, v14, v6}, Lcom/flyersoft/staticlayout/MyLayout;->getLineMax(I[Ljava/lang/Object;Z)F

    move-result v7

    float-to-int v7, v7

    .line 382
    sget-object v8, Lcom/flyersoft/staticlayout/MyLayout$Alignment;->ALIGN_RIGHT:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    const/4 v10, -0x1

    if-ne v1, v8, :cond_20

    .line 383
    sget-boolean v8, Lcom/flyersoft/tools/A;->textHyphenation:Z

    if-eqz v8, :cond_1e

    iget v8, v0, Lcom/flyersoft/staticlayout/MyLayout;->mWidth:I

    iget-object v11, v0, Lcom/flyersoft/staticlayout/MyLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    iget v11, v11, Lcom/flyersoft/staticlayout/MRTextView;->mInnerWidth:I

    sub-int/2addr v8, v11

    goto :goto_10

    :cond_1e
    const/4 v8, 0x0

    :goto_10
    if-ne v3, v10, :cond_1f

    add-int/2addr v4, v7

    goto :goto_e

    :cond_1f
    sub-int v4, v17, v7

    sub-int/2addr v4, v8

    goto :goto_e

    :cond_20
    and-int/lit8 v7, v7, -0x2

    sub-int v8, v17, v4

    sub-int/2addr v8, v7

    const/4 v7, 0x1

    shr-int/2addr v8, v7

    if-ne v3, v10, :cond_21

    sub-int v4, v17, v8

    goto :goto_f

    :cond_21
    add-int/2addr v4, v8

    goto :goto_f

    .line 400
    :goto_11
    invoke-virtual {v0, v2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineDirections(I)Lcom/flyersoft/staticlayout/MyLayout$Directions;

    move-result-object v6

    .line 401
    invoke-virtual {v0, v2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineContainsTab(I)Z

    move-result v13

    .line 402
    sget-object v2, Lcom/flyersoft/staticlayout/MyLayout;->DIRS_ALL_LEFT_TO_RIGHT:Lcom/flyersoft/staticlayout/MyLayout$Directions;

    if-ne v6, v2, :cond_22

    iget-boolean v2, v0, Lcom/flyersoft/staticlayout/MyLayout;->mSpannedText:Z

    if-nez v2, :cond_22

    if-nez v13, :cond_22

    .line 403
    iget-object v2, v0, Lcom/flyersoft/staticlayout/MyLayout;->mText:Ljava/lang/CharSequence;

    int-to-float v3, v4

    int-to-float v4, v9

    iget-object v6, v0, Lcom/flyersoft/staticlayout/MyLayout;->mPaint:Landroid/text/TextPaint;

    move-object/from16 v17, p1

    move-object/from16 v18, v2

    move/from16 v21, v3

    move/from16 v22, v4

    move-object/from16 v23, v6

    invoke-virtual/range {v17 .. v23}, Landroid/graphics/Canvas;->drawText(Ljava/lang/CharSequence;IIFFLandroid/graphics/Paint;)V

    move/from16 v18, p4

    move-object/from16 v19, v1

    move/from16 v17, v5

    const/16 v20, 0x0

    const/16 v21, 0x1

    goto :goto_12

    .line 405
    :cond_22
    iget-object v2, v0, Lcom/flyersoft/staticlayout/MyLayout;->mText:Ljava/lang/CharSequence;

    int-to-float v4, v4

    iget-object v11, v0, Lcom/flyersoft/staticlayout/MyLayout;->mPaint:Landroid/text/TextPaint;

    iget-object v12, v0, Lcom/flyersoft/staticlayout/MyLayout;->mWorkPaint:Landroid/text/TextPaint;

    move/from16 v18, p4

    move v7, v4

    move/from16 v17, v5

    move/from16 v4, v20

    move/from16 v8, v22

    move/from16 v10, v25

    const/16 v20, 0x0

    const/16 v21, 0x1

    move v5, v3

    move/from16 v3, v19

    move-object/from16 v19, v1

    move-object/from16 v1, p1

    invoke-direct/range {v0 .. v14}, Lcom/flyersoft/staticlayout/MyLayout;->drawText(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIILcom/flyersoft/staticlayout/MyLayout$Directions;FIIILandroid/text/TextPaint;Landroid/text/TextPaint;Z[Ljava/lang/Object;)V

    :goto_12
    const/16 p3, 0x1

    move-object/from16 v0, p0

    move-object v4, v14

    move/from16 v5, v17

    move/from16 v2, v18

    move-object/from16 v6, v19

    move/from16 v3, v24

    move/from16 v8, v25

    goto/16 :goto_3

    :cond_23
    return-void
.end method

.method public final getAlignment()Lcom/flyersoft/staticlayout/MyLayout$Alignment;
    .locals 1

    .line 474
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->mAlignment:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    return-object v0
.end method

.method public abstract getBottomPadding()I
.end method

.method public abstract getEllipsisCount(I)I
.end method

.method public abstract getEllipsisStart(I)I
.end method

.method public getEllipsizedWidth()I
    .locals 1

    .line 447
    iget v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->mWidth:I

    return v0
.end method

.method public getHeight()I
    .locals 1

    .line 467
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyLayout;->getLineCount()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTop(I)I

    move-result v0

    return v0
.end method

.method public final getLineAscent(I)I
    .locals 2

    .line 908
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTop(I)I

    move-result v0

    add-int/lit8 v1, p1, 0x1

    invoke-virtual {p0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTop(I)I

    move-result v1

    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineDescent(I)I

    move-result p1

    sub-int/2addr v1, p1

    sub-int/2addr v0, v1

    return v0
.end method

.method public final getLineBaseline(I)I
    .locals 1

    add-int/lit8 v0, p1, 0x1

    .line 900
    invoke-virtual {p0, v0}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTop(I)I

    move-result v0

    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineDescent(I)I

    move-result p1

    sub-int/2addr v0, p1

    return v0
.end method

.method public final getLineBottom(I)I
    .locals 0

    add-int/lit8 p1, p1, 0x1

    .line 893
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTop(I)I

    move-result p1

    return p1
.end method

.method public getLineBounds(ILandroid/graphics/Rect;)I
    .locals 1

    if-eqz p2, :cond_0

    const/4 v0, 0x0

    .line 506
    iput v0, p2, Landroid/graphics/Rect;->left:I

    .line 507
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTop(I)I

    move-result v0

    iput v0, p2, Landroid/graphics/Rect;->top:I

    .line 508
    iget v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->mWidth:I

    iput v0, p2, Landroid/graphics/Rect;->right:I

    .line 509
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineBottom(I)I

    move-result v0

    iput v0, p2, Landroid/graphics/Rect;->bottom:I

    .line 511
    :cond_0
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineBaseline(I)I

    move-result p1

    return p1
.end method

.method public abstract getLineContainsTab(I)Z
.end method

.method public abstract getLineCount()I
.end method

.method public abstract getLineDescent(I)I
.end method

.method public abstract getLineDirections(I)Lcom/flyersoft/staticlayout/MyLayout$Directions;
.end method

.method public final getLineEnd(I)I
    .locals 0

    add-int/lit8 p1, p1, 0x1

    .line 852
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result p1

    return p1
.end method

.method public getLineFloat(I)I
    .locals 1

    .line 113
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->floatLines:Landroid/util/SparseIntArray;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 115
    :cond_0
    invoke-virtual {v0, p1}, Landroid/util/SparseIntArray;->get(I)I

    move-result p1

    return p1
.end method

.method public getLineFloatSp(I)Lcom/flyersoft/staticlayout/MyFloatSpan;
    .locals 1

    .line 119
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->floatLineSpans:Ljava/util/Map;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 121
    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/staticlayout/MyFloatSpan;

    return-object p1
.end method

.method public getLineForOffset(I)I
    .locals 4

    .line 752
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyLayout;->getLineCount()I

    move-result v0

    const/4 v1, -0x1

    :goto_0
    sub-int v2, v0, v1

    const/4 v3, 0x1

    if-le v2, v3, :cond_1

    add-int v2, v0, v1

    .line 755
    div-int/lit8 v2, v2, 0x2

    .line 757
    invoke-virtual {p0, v2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v3

    if-le v3, p1, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v1, v2

    goto :goto_0

    :cond_1
    if-gez v1, :cond_2

    const/4 p1, 0x0

    return p1

    :cond_2
    return v1
.end method

.method public getLineForVertical(I)I
    .locals 4

    .line 729
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyLayout;->getLineCount()I

    move-result v0

    const/4 v1, -0x1

    :goto_0
    sub-int v2, v0, v1

    const/4 v3, 0x1

    if-le v2, v3, :cond_1

    add-int v2, v0, v1

    .line 732
    div-int/lit8 v2, v2, 0x2

    .line 734
    invoke-virtual {p0, v2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTop(I)I

    move-result v3

    if-le v3, p1, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v1, v2

    goto :goto_0

    :cond_1
    if-gez v1, :cond_2

    const/4 p1, 0x0

    return p1

    :cond_2
    return v1
.end method

.method public getLineLeft(I)F
    .locals 5

    .line 638
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getParagraphDirection(I)I

    move-result v0

    .line 639
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getParagraphAlignment(I)Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    move-result-object v1

    .line 641
    invoke-static {v1}, Lcom/flyersoft/staticlayout/MyLayout;->alignNormal(Lcom/flyersoft/staticlayout/MyLayout$Alignment;)Z

    move-result v2

    const/4 v3, 0x0

    const/4 v4, -0x1

    if-eqz v2, :cond_1

    if-ne v0, v4, :cond_0

    .line 643
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getParagraphRight(I)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineMax(I)F

    move-result p1

    :goto_0
    sub-float/2addr v0, p1

    return v0

    :cond_0
    return v3

    .line 646
    :cond_1
    sget-object v2, Lcom/flyersoft/staticlayout/MyLayout$Alignment;->ALIGN_RIGHT:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    if-ne v1, v2, :cond_3

    if-ne v0, v4, :cond_2

    return v3

    .line 650
    :cond_2
    iget v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->mWidth:I

    int-to-float v0, v0

    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineMax(I)F

    move-result p1

    goto :goto_0

    .line 652
    :cond_3
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getParagraphLeft(I)I

    move-result v0

    .line 653
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getParagraphRight(I)I

    move-result v1

    .line 654
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineMax(I)F

    move-result p1

    float-to-int p1, p1

    and-int/lit8 p1, p1, -0x2

    sub-int/2addr v1, v0

    sub-int/2addr v1, p1

    .line 656
    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    int-to-float p1, v0

    return p1
.end method

.method public getLineMax(I)F
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 692
    invoke-direct {p0, p1, v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineMax(I[Ljava/lang/Object;Z)F

    move-result p1

    return p1
.end method

.method public getLineRight(I)F
    .locals 4

    .line 665
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getParagraphDirection(I)I

    move-result v0

    .line 666
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getParagraphAlignment(I)Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    move-result-object v1

    .line 668
    invoke-static {v1}, Lcom/flyersoft/staticlayout/MyLayout;->alignNormal(Lcom/flyersoft/staticlayout/MyLayout$Alignment;)Z

    move-result v2

    const/4 v3, -0x1

    if-eqz v2, :cond_1

    if-ne v0, v3, :cond_0

    .line 670
    iget p1, p0, Lcom/flyersoft/staticlayout/MyLayout;->mWidth:I

    int-to-float p1, p1

    return p1

    .line 672
    :cond_0
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getParagraphLeft(I)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineMax(I)F

    move-result p1

    add-float/2addr v0, p1

    return v0

    .line 673
    :cond_1
    sget-object v2, Lcom/flyersoft/staticlayout/MyLayout$Alignment;->ALIGN_RIGHT:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    if-ne v1, v2, :cond_3

    if-ne v0, v3, :cond_2

    .line 675
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineMax(I)F

    move-result p1

    return p1

    .line 677
    :cond_2
    iget p1, p0, Lcom/flyersoft/staticlayout/MyLayout;->mWidth:I

    int-to-float p1, p1

    return p1

    .line 679
    :cond_3
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getParagraphLeft(I)I

    move-result v0

    .line 680
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getParagraphRight(I)I

    move-result v1

    .line 681
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineMax(I)F

    move-result p1

    float-to-int p1, p1

    and-int/lit8 p1, p1, -0x2

    sub-int v0, v1, v0

    sub-int/2addr v0, p1

    .line 683
    div-int/lit8 v0, v0, 0x2

    sub-int/2addr v1, v0

    int-to-float p1, v1

    return p1
.end method

.method public getLineSep(I)I
    .locals 1

    .line 65
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->hyphLines:Landroid/util/SparseIntArray;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 67
    :cond_0
    invoke-virtual {v0, p1}, Landroid/util/SparseIntArray;->get(I)I

    move-result p1

    return p1
.end method

.method public abstract getLineStart(I)I
.end method

.method public abstract getLineTop(I)I
.end method

.method public getLineTopAdded(I)I
    .locals 1

    .line 85
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->topAddedLines:Landroid/util/SparseIntArray;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 87
    :cond_0
    invoke-virtual {v0, p1}, Landroid/util/SparseIntArray;->get(I)I

    move-result p1

    return p1
.end method

.method public getLineTopAdded2(I)I
    .locals 1

    .line 97
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->topAddedLines2:Landroid/util/SparseIntArray;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 99
    :cond_0
    invoke-virtual {v0, p1}, Landroid/util/SparseIntArray;->get(I)I

    move-result p1

    return p1
.end method

.method public getLineVisibleEnd(I)I
    .locals 2

    .line 860
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v0

    add-int/lit8 v1, p1, 0x1

    invoke-virtual {p0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v1

    invoke-direct {p0, p1, v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineVisibleEnd(III)I

    move-result p1

    return p1
.end method

.method public getLineWidth(I)F
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 700
    invoke-direct {p0, p1, v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineMax(I[Ljava/lang/Object;Z)F

    move-result p1

    return p1
.end method

.method public getOffsetForHorizontal(IF)I
    .locals 16

    move-object/from16 v0, p0

    .line 774
    invoke-virtual/range {p0 .. p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineEnd(I)I

    move-result v1

    add-int/lit8 v2, v1, -0x1

    .line 775
    invoke-virtual/range {p0 .. p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v3

    .line 776
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MyLayout;->getLineCount()I

    move-result v4

    const/4 v5, 0x1

    sub-int/2addr v4, v5

    move/from16 v6, p1

    if-ne v6, v4, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    .line 780
    :goto_0
    invoke-virtual {v0, v3}, Lcom/flyersoft/staticlayout/MyLayout;->getPrimaryHorizontal(I)F

    move-result v2

    sub-float v2, v2, p2

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    .line 783
    invoke-virtual/range {p0 .. p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineDirections(I)Lcom/flyersoft/staticlayout/MyLayout$Directions;

    move-result-object v4

    if-eqz v4, :cond_9

    .line 784
    invoke-static {v4}, Lcom/flyersoft/staticlayout/MyLayout$Directions;->-$$Nest$fgetmDirections(Lcom/flyersoft/staticlayout/MyLayout$Directions;)[S

    move-result-object v6

    if-eqz v6, :cond_9

    const/4 v6, 0x0

    move v6, v3

    const/4 v7, 0x0

    .line 785
    :goto_1
    invoke-static {v4}, Lcom/flyersoft/staticlayout/MyLayout$Directions;->-$$Nest$fgetmDirections(Lcom/flyersoft/staticlayout/MyLayout$Directions;)[S

    move-result-object v8

    array-length v8, v8

    if-ge v7, v8, :cond_9

    .line 786
    invoke-static {v4}, Lcom/flyersoft/staticlayout/MyLayout$Directions;->-$$Nest$fgetmDirections(Lcom/flyersoft/staticlayout/MyLayout$Directions;)[S

    move-result-object v8

    aget-short v8, v8, v7

    add-int/2addr v8, v6

    and-int/lit8 v9, v7, 0x1

    if-nez v9, :cond_1

    const/4 v9, 0x1

    goto :goto_2

    :cond_1
    const/4 v9, -0x1

    :goto_2
    if-le v8, v1, :cond_2

    move v8, v1

    :cond_2
    add-int/lit8 v10, v6, 0x1

    move v12, v6

    move v11, v8

    :goto_3
    sub-int v13, v11, v12

    if-le v13, v5, :cond_4

    add-int v13, v11, v12

    .line 795
    div-int/lit8 v13, v13, 0x2

    .line 796
    invoke-direct {v0, v13}, Lcom/flyersoft/staticlayout/MyLayout;->getOffsetAtStartOf(I)I

    move-result v14

    .line 798
    invoke-virtual {v0, v14}, Lcom/flyersoft/staticlayout/MyLayout;->getPrimaryHorizontal(I)F

    move-result v14

    int-to-float v15, v9

    mul-float v14, v14, v15

    mul-float v15, v15, p2

    cmpl-float v14, v14, v15

    if-ltz v14, :cond_3

    move v11, v13

    goto :goto_3

    :cond_3
    move v12, v13

    goto :goto_3

    :cond_4
    if-ge v12, v10, :cond_5

    goto :goto_4

    :cond_5
    move v10, v12

    :goto_4
    if-ge v10, v8, :cond_7

    .line 808
    invoke-direct {v0, v10}, Lcom/flyersoft/staticlayout/MyLayout;->getOffsetAtStartOf(I)I

    move-result v9

    .line 810
    invoke-virtual {v0, v9}, Lcom/flyersoft/staticlayout/MyLayout;->getPrimaryHorizontal(I)F

    move-result v10

    sub-float v10, v10, p2

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v10

    .line 812
    iget-object v11, v0, Lcom/flyersoft/staticlayout/MyLayout;->mText:Ljava/lang/CharSequence;

    invoke-static {v11, v9}, Lcom/flyersoft/staticlayout/TextUtils;->getOffsetAfter(Ljava/lang/CharSequence;I)I

    move-result v11

    if-ge v11, v8, :cond_6

    .line 814
    invoke-virtual {v0, v11}, Lcom/flyersoft/staticlayout/MyLayout;->getPrimaryHorizontal(I)F

    move-result v12

    sub-float v12, v12, p2

    invoke-static {v12}, Ljava/lang/Math;->abs(F)F

    move-result v12

    cmpg-float v13, v12, v10

    if-gez v13, :cond_6

    move v9, v11

    move v10, v12

    :cond_6
    cmpg-float v11, v10, v2

    if-gez v11, :cond_7

    move v3, v9

    move v2, v10

    .line 828
    :cond_7
    invoke-virtual {v0, v6}, Lcom/flyersoft/staticlayout/MyLayout;->getPrimaryHorizontal(I)F

    move-result v9

    sub-float v9, v9, p2

    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    move-result v9

    cmpg-float v10, v9, v2

    if-gez v10, :cond_8

    move v3, v6

    move v2, v9

    :cond_8
    add-int/lit8 v7, v7, 0x1

    move v6, v8

    goto :goto_1

    .line 838
    :cond_9
    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getPrimaryHorizontal(I)F

    move-result v4

    sub-float v4, v4, p2

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    cmpg-float v2, v4, v2

    if-gez v2, :cond_a

    return v1

    :cond_a
    return v3
.end method

.method public final getPaint()Landroid/text/TextPaint;
    .locals 1

    .line 432
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->mPaint:Landroid/text/TextPaint;

    return-object v0
.end method

.method public final getParagraphAlignment(I)Lcom/flyersoft/staticlayout/MyLayout$Alignment;
    .locals 1

    .line 955
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineAlign(I)I

    move-result p1

    invoke-static {p1}, Lcom/flyersoft/staticlayout/MRTextView;->getAlignment(I)Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    move-result-object p1

    return-object p1
.end method

.method public abstract getParagraphDirection(I)I
.end method

.method public final getParagraphLeft(I)I
    .locals 4

    .line 962
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getParagraphDirection(I)I

    move-result v0

    .line 967
    iget-object v1, p0, Lcom/flyersoft/staticlayout/MyLayout;->mText:Ljava/lang/CharSequence;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    goto :goto_1

    :cond_0
    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    .line 974
    iget-boolean v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->mSpannedText:Z

    if-eqz v0, :cond_2

    .line 976
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineSpans(I)[Ljava/lang/Object;

    move-result-object p1

    const-class v0, Lcom/flyersoft/staticlayout/MyMarginSpan;

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->getSpans([Ljava/lang/Object;Ljava/lang/Class;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/flyersoft/staticlayout/MyMarginSpan;

    const/4 v0, 0x0

    .line 978
    :goto_0
    array-length v1, p1

    if-ge v2, v1, :cond_1

    int-to-float v0, v0

    .line 979
    aget-object v1, p1, v2

    iget v1, v1, Lcom/flyersoft/staticlayout/MyMarginSpan;->leftMargin:F

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v3

    mul-float v1, v1, v3

    add-float/2addr v0, v1

    float-to-int v0, v0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return v0

    :cond_2
    :goto_1
    return v2
.end method

.method public final getParagraphRight(I)I
    .locals 4

    .line 991
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getParagraphDirection(I)I

    move-result v0

    .line 993
    iget v1, p0, Lcom/flyersoft/staticlayout/MyLayout;->mWidth:I

    .line 994
    iget-object v2, p0, Lcom/flyersoft/staticlayout/MyLayout;->mText:Ljava/lang/CharSequence;

    if-nez v2, :cond_0

    goto :goto_1

    :cond_0
    const/4 v2, -0x1

    if-ne v0, v2, :cond_1

    .line 1004
    iget-boolean v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->mSpannedText:Z

    if-eqz v0, :cond_1

    .line 1006
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineSpans(I)[Ljava/lang/Object;

    move-result-object p1

    const-class v0, Lcom/flyersoft/staticlayout/MyMarginSpan;

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->getSpans([Ljava/lang/Object;Ljava/lang/Class;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/flyersoft/staticlayout/MyMarginSpan;

    const/4 v0, 0x0

    .line 1008
    :goto_0
    array-length v2, p1

    if-ge v0, v2, :cond_1

    int-to-float v1, v1

    .line 1009
    aget-object v2, p1, v0

    iget v2, v2, Lcom/flyersoft/staticlayout/MyMarginSpan;->leftMargin:F

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v3

    mul-float v2, v2, v3

    sub-float/2addr v1, v2

    float-to-int v1, v1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return v1
.end method

.method public getPrimaryHorizontal(I)F
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 571
    invoke-direct {p0, p1, v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getHorizontal(IZZ)F

    move-result p1

    return p1
.end method

.method public final getSpacingAdd()F
    .locals 1

    .line 488
    iget v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->mSpacingAdd:F

    return v0
.end method

.method public final getSpacingMultiplier()F
    .locals 1

    .line 481
    iget v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->mSpacingMult:F

    return v0
.end method

.method public final getText()Ljava/lang/CharSequence;
    .locals 1

    .line 423
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->mText:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public abstract getTopPadding()I
.end method

.method public final getWidth()I
    .locals 1

    .line 439
    iget v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->mWidth:I

    return v0
.end method

.method public final increaseWidthTo(I)V
    .locals 1

    .line 456
    iget v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->mWidth:I

    if-lt p1, v0, :cond_0

    .line 460
    iput p1, p0, Lcom/flyersoft/staticlayout/MyLayout;->mWidth:I

    return-void

    .line 457
    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "attempted to reduce Layout width"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method protected final isSpanned()Z
    .locals 1

    .line 1344
    iget-boolean v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->mSpannedText:Z

    return v0
.end method

.method public removeLineSep(I)V
    .locals 1

    .line 71
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->hyphLines:Landroid/util/SparseIntArray;

    if-nez v0, :cond_0

    return-void

    .line 73
    :cond_0
    invoke-virtual {v0, p1}, Landroid/util/SparseIntArray;->delete(I)V

    return-void
.end method

.method replaceWith(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILcom/flyersoft/staticlayout/MyLayout$Alignment;FF)V
    .locals 0

    if-ltz p3, :cond_0

    .line 203
    iput-object p1, p0, Lcom/flyersoft/staticlayout/MyLayout;->mText:Ljava/lang/CharSequence;

    .line 204
    iput-object p2, p0, Lcom/flyersoft/staticlayout/MyLayout;->mPaint:Landroid/text/TextPaint;

    .line 205
    iput p3, p0, Lcom/flyersoft/staticlayout/MyLayout;->mWidth:I

    .line 206
    iput-object p4, p0, Lcom/flyersoft/staticlayout/MyLayout;->mAlignment:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    .line 207
    iput p5, p0, Lcom/flyersoft/staticlayout/MyLayout;->mSpacingMult:F

    .line 208
    iput p6, p0, Lcom/flyersoft/staticlayout/MyLayout;->mSpacingAdd:F

    .line 209
    instance-of p1, p1, Landroid/text/Spanned;

    iput-boolean p1, p0, Lcom/flyersoft/staticlayout/MyLayout;->mSpannedText:Z

    return-void

    .line 200
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p4, "Layout: "

    invoke-direct {p2, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, " < 0"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setLineFloat(ILcom/flyersoft/staticlayout/MyFloatSpan;I)V
    .locals 1

    .line 106
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->floatLines:Landroid/util/SparseIntArray;

    if-nez v0, :cond_0

    return-void

    .line 108
    :cond_0
    invoke-virtual {v0, p1, p3}, Landroid/util/SparseIntArray;->put(II)V

    .line 109
    iget-object p3, p0, Lcom/flyersoft/staticlayout/MyLayout;->floatLineSpans:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p3, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public setLineSep(II)V
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->hyphLines:Landroid/util/SparseIntArray;

    if-nez v0, :cond_0

    return-void

    .line 61
    :cond_0
    invoke-virtual {v0, p1, p2}, Landroid/util/SparseIntArray;->put(II)V

    return-void
.end method

.method public setLineTopAdded(II)V
    .locals 1

    .line 79
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->topAddedLines:Landroid/util/SparseIntArray;

    if-nez v0, :cond_0

    return-void

    .line 81
    :cond_0
    invoke-virtual {v0, p1, p2}, Landroid/util/SparseIntArray;->put(II)V

    return-void
.end method

.method public setLineTopAdded2(II)V
    .locals 1

    .line 91
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyLayout;->topAddedLines2:Landroid/util/SparseIntArray;

    if-nez v0, :cond_0

    return-void

    .line 93
    :cond_0
    invoke-virtual {v0, p1, p2}, Landroid/util/SparseIntArray;->put(II)V

    return-void
.end method
