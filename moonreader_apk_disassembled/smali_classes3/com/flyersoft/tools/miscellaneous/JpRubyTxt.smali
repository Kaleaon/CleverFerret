.class public Lcom/flyersoft/tools/miscellaneous/JpRubyTxt;
.super Ljava/lang/Object;
.source "JpRubyTxt.java"


# static fields
.field private static imageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static dealJpRubyTxt(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 17

    .line 20
    invoke-interface/range {p0 .. p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 21
    const-string v1, "\u300a"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    const-string v3, "\u300b"

    const-string v4, ".jpg\uff09"

    const/4 v5, -0x1

    if-eq v2, v5, :cond_0

    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-ne v2, v5, :cond_1

    :cond_0
    invoke-virtual {v0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-eq v2, v5, :cond_17

    .line 22
    :cond_1
    new-instance v2, Landroid/text/SpannableStringBuilder;

    invoke-direct {v2}, Landroid/text/SpannableStringBuilder;-><init>()V

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    .line 27
    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v10

    const/4 v11, 0x1

    if-ge v8, v10, :cond_10

    add-int/lit8 v10, v8, 0x1

    .line 28
    invoke-virtual {v0, v1, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v12

    if-eq v12, v5, :cond_10

    .line 30
    invoke-virtual {v0, v3, v12}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v13

    if-eq v13, v5, :cond_10

    sub-int v14, v13, v12

    if-le v14, v11, :cond_e

    const/16 v15, 0xc

    if-ge v14, v15, :cond_e

    add-int/lit8 v14, v12, 0x1

    .line 33
    invoke-virtual {v0, v14, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v14

    add-int/lit8 v15, v12, -0x1

    :goto_1
    if-le v15, v8, :cond_3

    add-int/lit8 v6, v15, -0x1

    const/16 v16, 0x1

    sub-int v11, v12, v6

    .line 37
    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v5

    if-gt v11, v5, :cond_4

    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character$UnicodeBlock;->of(C)Ljava/lang/Character$UnicodeBlock;

    move-result-object v5

    sget-object v11, Ljava/lang/Character$UnicodeBlock;->CJK_UNIFIED_IDEOGRAPHS:Ljava/lang/Character$UnicodeBlock;

    if-eq v5, v11, :cond_2

    goto :goto_2

    :cond_2
    move v15, v6

    const/4 v5, -0x1

    const/4 v11, 0x1

    goto :goto_1

    :cond_3
    const/16 v16, 0x1

    :cond_4
    :goto_2
    if-nez v9, :cond_6

    .line 44
    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    const/4 v9, -0x1

    if-eq v5, v9, :cond_5

    goto :goto_3

    .line 46
    :cond_5
    invoke-virtual {v2, v6}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    :goto_3
    const/4 v9, 0x1

    :cond_6
    if-eqz v7, :cond_c

    .line 50
    iget v5, v7, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->end:I

    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v6

    if-ne v5, v6, :cond_c

    if-ne v10, v15, :cond_c

    .line 52
    iget-object v5, v7, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->rt:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    iget v6, v7, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->end:I

    iget v11, v7, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->start:I

    sub-int/2addr v6, v11

    const/4 v11, 0x2

    mul-int/lit8 v6, v6, 0x2

    if-le v5, v6, :cond_7

    .line 53
    iget-object v5, v7, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->rt:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    iget v6, v7, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->end:I

    iget v7, v7, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->start:I

    sub-int/2addr v6, v7

    mul-int/lit8 v6, v6, 0x2

    sub-int/2addr v5, v6

    goto :goto_4

    :cond_7
    const/4 v5, 0x0

    .line 54
    :goto_4
    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v6

    sub-int v7, v12, v15

    mul-int/lit8 v7, v7, 0x2

    if-le v6, v7, :cond_8

    .line 55
    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v6

    sub-int/2addr v6, v7

    add-int/2addr v5, v6

    :cond_8
    if-lez v5, :cond_c

    const/4 v6, 0x3

    if-eq v5, v11, :cond_a

    if-ne v5, v6, :cond_9

    goto :goto_5

    .line 57
    :cond_9
    const-string v7, " "

    goto :goto_6

    :cond_a
    :goto_5
    const-string v7, "\u3000"

    :goto_6
    if-le v5, v6, :cond_b

    .line 59
    div-int/lit8 v5, v5, 0x3

    const/4 v6, 0x0

    :goto_7
    if-ge v6, v5, :cond_b

    .line 60
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v7, 0x3000

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    add-int/lit8 v6, v6, 0x1

    goto :goto_7

    .line 62
    :cond_b
    invoke-virtual {v2, v7}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto :goto_8

    .line 66
    :cond_c
    const-string v7, ""

    :goto_8
    if-nez v8, :cond_d

    goto :goto_9

    :cond_d
    move v8, v10

    :goto_9
    invoke-virtual {v2, v0, v8, v12}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;II)Landroid/text/SpannableStringBuilder;

    .line 67
    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v5

    sub-int v6, v12, v15

    sub-int v6, v5, v6

    .line 69
    new-instance v8, Lcom/flyersoft/staticlayout/MyHtml$Ruby;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v15, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v14, v7, v6, v5}, Lcom/flyersoft/staticlayout/MyHtml$Ruby;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    const/16 v7, 0x21

    .line 70
    invoke-virtual {v2, v8, v6, v5, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    move-object v7, v8

    goto :goto_b

    :cond_e
    if-nez v8, :cond_f

    goto :goto_a

    :cond_f
    move v8, v10

    :goto_a
    add-int/lit8 v5, v13, 0x1

    .line 72
    invoke-virtual {v0, v8, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    :goto_b
    move v8, v13

    const/4 v5, -0x1

    goto/16 :goto_0

    :cond_10
    const/16 v16, 0x1

    if-nez v8, :cond_11

    goto :goto_c

    :cond_11
    add-int/lit8 v8, v8, 0x1

    .line 81
    :goto_c
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v8, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 83
    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 84
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v3, 0x0

    :goto_d
    if-lez v1, :cond_15

    .line 87
    invoke-virtual {v0, v4, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v5

    const/4 v9, -0x1

    if-eq v5, v9, :cond_15

    .line 89
    const-string v6, "\uff08"

    invoke-virtual {v0, v6, v5}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v6

    if-eq v6, v9, :cond_15

    .line 91
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v7, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-static {v7}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "/"

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v7, v6, 0x1

    add-int/lit8 v5, v5, 0x4

    invoke-virtual {v0, v7, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 92
    invoke-static {v1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_14

    .line 94
    const-string v3, "\uff3d"

    invoke-virtual {v0, v3, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    const/16 v7, 0x64

    const/4 v9, -0x1

    if-eq v3, v9, :cond_12

    sub-int v8, v3, v5

    if-ge v8, v7, :cond_12

    move v5, v3

    .line 97
    :cond_12
    const-string v3, "\uff3b"

    invoke-virtual {v0, v3, v6}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v3

    if-eq v3, v9, :cond_13

    sub-int v8, v6, v3

    if-ge v8, v7, :cond_13

    move v6, v3

    :cond_13
    add-int/lit8 v5, v5, 0x1

    .line 100
    invoke-static {v2, v1, v6, v5}, Lcom/flyersoft/tools/miscellaneous/JpRubyTxt;->replaceWithImg(Landroid/text/SpannableStringBuilder;Ljava/lang/String;II)V

    const/4 v3, 0x1

    goto :goto_e

    :cond_14
    const/4 v9, -0x1

    :goto_e
    move v1, v6

    goto :goto_d

    :cond_15
    if-eqz v3, :cond_16

    .line 110
    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    const-class v3, Lcom/flyersoft/staticlayout/MyHtml$Ruby;

    invoke-virtual {v2, v1, v0, v3}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/staticlayout/MyHtml$Ruby;

    .line 111
    array-length v1, v0

    const/4 v6, 0x0

    :goto_f
    if-ge v6, v1, :cond_16

    aget-object v3, v0, v6

    .line 112
    invoke-virtual {v2, v3}, Landroid/text/SpannableStringBuilder;->getSpanStart(Ljava/lang/Object;)I

    move-result v4

    iput v4, v3, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->start:I

    .line 113
    invoke-virtual {v2, v3}, Landroid/text/SpannableStringBuilder;->getSpanEnd(Ljava/lang/Object;)I

    move-result v4

    iput v4, v3, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->end:I

    add-int/lit8 v6, v6, 0x1

    goto :goto_f

    :cond_16
    return-object v2

    :cond_17
    return-object p0
.end method

.method private static getImageGetter()Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;
    .locals 1

    .line 146
    sget-object v0, Lcom/flyersoft/tools/miscellaneous/JpRubyTxt;->imageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    if-nez v0, :cond_0

    .line 147
    new-instance v0, Lcom/flyersoft/tools/miscellaneous/JpRubyTxt$1;

    invoke-direct {v0}, Lcom/flyersoft/tools/miscellaneous/JpRubyTxt$1;-><init>()V

    sput-object v0, Lcom/flyersoft/tools/miscellaneous/JpRubyTxt;->imageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    .line 174
    :cond_0
    sget-object v0, Lcom/flyersoft/tools/miscellaneous/JpRubyTxt;->imageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    return-object v0
.end method

.method private static replaceWithImg(Landroid/text/SpannableStringBuilder;Ljava/lang/String;II)V
    .locals 7

    .line 128
    :try_start_0
    invoke-virtual {p0, p2, p3}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    .line 129
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v0, "\n"

    const/16 v1, 0xa

    const-string v2, ""

    if-lez p2, :cond_0

    add-int/lit8 v3, p2, -0x1

    :try_start_1
    invoke-virtual {p0, v3}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v3

    if-eq v3, v1, :cond_0

    move-object v3, v0

    goto :goto_0

    :cond_0
    move-object v3, v2

    :goto_0
    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\ufffc"

    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    if-ge p2, v3, :cond_1

    invoke-virtual {p0, p2}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v3

    if-eq v3, v1, :cond_1

    goto :goto_1

    :cond_1
    move-object v0, v2

    :goto_1
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 129
    invoke-virtual {p0, p2, p3}, Landroid/text/SpannableStringBuilder;->insert(ILjava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 133
    new-instance p3, Ljava/io/File;

    invoke-direct {p3, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v0, 0x0

    invoke-static {p3, v0, v0}, Lcom/flyersoft/tools/A;->getFileDrawable(Ljava/io/File;II)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    if-nez p3, :cond_2

    .line 135
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->unknown_image:I

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    :cond_2
    move-object v1, p3

    .line 137
    new-instance v0, Lcom/flyersoft/staticlayout/MyImageSpan;

    invoke-static {}, Lcom/flyersoft/tools/miscellaneous/JpRubyTxt;->getImageGetter()Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v2, 0x0

    move-object v3, p1

    invoke-direct/range {v0 .. v6}, Lcom/flyersoft/staticlayout/MyImageSpan;-><init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/Rect;Ljava/lang/String;Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;ZZ)V

    add-int/lit8 p1, p2, 0x1

    const/16 p3, 0x21

    invoke-virtual {p0, v0, p2, p1, p3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    move-object p0, v0

    .line 140
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method
