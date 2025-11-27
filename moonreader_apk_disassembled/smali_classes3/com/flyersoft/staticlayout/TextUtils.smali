.class public Lcom/flyersoft/staticlayout/TextUtils;
.super Ljava/lang/Object;
.source "TextUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/staticlayout/TextUtils$Reverser;,
        Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;,
        Lcom/flyersoft/staticlayout/TextUtils$EllipsizeCallback;,
        Lcom/flyersoft/staticlayout/TextUtils$SimpleStringSplitter;,
        Lcom/flyersoft/staticlayout/TextUtils$StringSplitter;
    }
.end annotation


# static fields
.field public static final ABSOLUTE_SIZE_SPAN:I = 0x10

.field public static final ALIGNMENT_SPAN:I = 0x1

.field public static final ANNOTATION:I = 0x12

.field public static final BACKGROUND_COLOR_SPAN:I = 0xc

.field public static final BULLET_SPAN:I = 0x8

.field public static final CAP_MODE_CHARACTERS:I = 0x1000

.field public static final CAP_MODE_SENTENCES:I = 0x4000

.field public static final CAP_MODE_WORDS:I = 0x2000

.field private static EMPTY_STRING_ARRAY:[Ljava/lang/String; = null

.field public static final FOREGROUND_COLOR_SPAN:I = 0x2

.field public static final LEADING_MARGIN_SPAN:I = 0xa

.field public static final QUOTE_SPAN:I = 0x9

.field public static final RELATIVE_SIZE_SPAN:I = 0x3

.field public static final SCALE_X_SPAN:I = 0x4

.field public static final STRIKETHROUGH_SPAN:I = 0x5

.field public static final STYLE_SPAN:I = 0x7

.field public static final SUBSCRIPT_SPAN:I = 0xf

.field public static final SUPERSCRIPT_SPAN:I = 0xe

.field public static final TEXT_APPEARANCE_SPAN:I = 0x11

.field public static final TYPEFACE_SPAN:I = 0xd

.field public static final UNDERLINE_SPAN:I = 0x6

.field public static final URL_SPAN:I = 0xb

.field private static sEllipsis:Ljava/lang/String;

.field private static sLock:Ljava/lang/Object;

.field private static sTemp:[C


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    .line 36
    new-array v0, v0, [Ljava/lang/String;

    sput-object v0, Lcom/flyersoft/staticlayout/TextUtils;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    .line 1479
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/flyersoft/staticlayout/TextUtils;->sLock:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static blank(Ljava/lang/CharSequence;II)Ljava/lang/String;
    .locals 3

    .line 1092
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    .line 1093
    invoke-static {v0}, Lcom/flyersoft/staticlayout/TextUtils;->obtain(I)[C

    move-result-object v1

    const/4 v2, 0x0

    if-eqz p1, :cond_0

    .line 1096
    invoke-static {p0, v2, p1, v1, v2}, Lcom/flyersoft/staticlayout/TextUtils;->getChars(Ljava/lang/CharSequence;II[CI)V

    :cond_0
    if-eq p2, v0, :cond_1

    .line 1099
    invoke-static {p0, p2, v0, v1, p2}, Lcom/flyersoft/staticlayout/TextUtils;->getChars(Ljava/lang/CharSequence;II[CI)V

    :cond_1
    if-eq p1, p2, :cond_2

    const/16 p0, 0x2026

    .line 1103
    aput-char p0, v1, p1

    :goto_0
    add-int/lit8 p1, p1, 0x1

    if-ge p1, p2, :cond_2

    const p0, 0xfeff

    .line 1106
    aput-char p0, v1, p1

    goto :goto_0

    .line 1110
    :cond_2
    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, v1, v2, v0}, Ljava/lang/String;-><init>([CII)V

    .line 1111
    invoke-static {v1}, Lcom/flyersoft/staticlayout/TextUtils;->recycle([C)V

    return-object p0
.end method

.method public static commaEllipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLjava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 16

    move-object/from16 v0, p0

    .line 1131
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v8

    .line 1132
    new-array v9, v8, [C

    const/4 v10, 0x0

    .line 1133
    invoke-static {v0, v10, v8, v9, v10}, Lcom/flyersoft/staticlayout/TextUtils;->getChars(Ljava/lang/CharSequence;II[CI)V

    const/4 v1, 0x0

    const/4 v11, 0x0

    :goto_0
    const/16 v12, 0x2c

    if-ge v1, v8, :cond_1

    .line 1137
    aget-char v2, v9, v1

    if-ne v2, v12, :cond_0

    add-int/lit8 v11, v11, 0x1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1144
    :cond_1
    instance-of v1, v0, Landroid/text/Spanned;

    if-eqz v1, :cond_3

    .line 1145
    move-object v3, v0

    check-cast v3, Landroid/text/Spanned;

    .line 1146
    new-instance v2, Landroid/text/TextPaint;

    invoke-direct {v2}, Landroid/text/TextPaint;-><init>()V

    mul-int/lit8 v1, v8, 0x2

    .line 1147
    new-array v6, v1, [F

    const/4 v4, 0x0

    :goto_1
    if-ge v4, v8, :cond_2

    .line 1151
    const-class v1, Landroid/text/style/MetricAffectingSpan;

    invoke-interface {v3, v4, v8, v1}, Landroid/text/Spanned;->nextSpanTransition(IILjava/lang/Class;)I

    move-result v5

    const/4 v7, 0x0

    move-object/from16 v1, p1

    .line 1153
    invoke-static/range {v1 .. v7}, Lcom/flyersoft/staticlayout/Styled;->getTextWidths(Landroid/text/TextPaint;Landroid/text/TextPaint;Landroid/text/Spanned;II[FLandroid/graphics/Paint$FontMetricsInt;)I

    add-int v7, v8, v4

    sub-int v4, v5, v4

    .line 1154
    invoke-static {v6, v10, v6, v7, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move v4, v5

    goto :goto_1

    :cond_2
    move-object/from16 v1, p1

    .line 1157
    invoke-static {v6, v8, v6, v10, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_2

    :cond_3
    move-object/from16 v1, p1

    .line 1159
    new-array v6, v8, [F

    .line 1160
    invoke-virtual {v1, v0, v10, v8, v6}, Landroid/text/TextPaint;->getTextWidths(Ljava/lang/CharSequence;II[F)I

    .line 1170
    :goto_2
    const-string v2, ""

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v7, 0x0

    :goto_3
    if-ge v3, v8, :cond_7

    int-to-float v4, v4

    .line 1171
    aget v13, v6, v3

    add-float/2addr v4, v13

    float-to-int v4, v4

    .line 1173
    aget-char v13, v9, v3

    if-ne v13, v12, :cond_5

    add-int/lit8 v7, v7, 0x1

    sub-int v13, v11, v7

    const/4 v14, 0x1

    add-int/2addr v13, v14

    .line 1180
    const-string v15, " "

    if-ne v13, v14, :cond_4

    .line 1181
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v14, p3

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    move-object v12, v13

    move-object/from16 v13, p4

    goto :goto_4

    .line 1183
    :cond_4
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    new-array v14, v14, [Ljava/lang/Object;

    aput-object v13, v14, v10

    move-object/from16 v13, p4

    invoke-static {v13, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 1186
    :goto_4
    invoke-virtual {v1, v12}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v14

    int-to-float v15, v4

    add-float/2addr v15, v14

    cmpg-float v14, v15, p2

    if-gtz v14, :cond_6

    add-int/lit8 v5, v3, 0x1

    move-object v2, v12

    goto :goto_5

    :cond_5
    move-object/from16 v13, p4

    :cond_6
    :goto_5
    add-int/lit8 v3, v3, 0x1

    const/16 v12, 0x2c

    goto :goto_3

    :cond_7
    int-to-float v1, v4

    cmpg-float v1, v1, p2

    if-gtz v1, :cond_8

    return-object v0

    .line 1199
    :cond_8
    new-instance v1, Landroid/text/SpannableStringBuilder;

    invoke-direct {v1, v2}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 1200
    invoke-virtual {v1, v10, v0, v10, v5}, Landroid/text/SpannableStringBuilder;->insert(ILjava/lang/CharSequence;II)Landroid/text/SpannableStringBuilder;

    return-object v1
.end method

.method public static varargs concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 7

    .line 1266
    array-length v0, p0

    if-nez v0, :cond_0

    .line 1267
    const-string p0, ""

    return-object p0

    .line 1270
    :cond_0
    array-length v0, p0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_1

    .line 1271
    aget-object p0, p0, v2

    return-object p0

    :cond_1
    const/4 v0, 0x0

    .line 1275
    :goto_0
    array-length v3, p0

    if-ge v0, v3, :cond_3

    .line 1276
    aget-object v3, p0, v0

    instance-of v3, v3, Landroid/text/Spanned;

    if-eqz v3, :cond_2

    goto :goto_1

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    const/4 v1, 0x0

    .line 1282
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v3, 0x0

    .line 1283
    :goto_2
    array-length v4, p0

    if-ge v3, v4, :cond_4

    .line 1284
    aget-object v4, p0, v3

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_4
    if-nez v1, :cond_5

    .line 1288
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 1291
    :cond_5
    new-instance v4, Landroid/text/SpannableString;

    invoke-direct {v4, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 1293
    :goto_3
    array-length v0, p0

    if-ge v6, v0, :cond_7

    .line 1294
    aget-object v0, p0, v6

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    .line 1296
    aget-object v0, p0, v6

    instance-of v1, v0, Landroid/text/Spanned;

    if-eqz v1, :cond_6

    .line 1297
    check-cast v0, Landroid/text/Spanned;

    const/4 v1, 0x0

    const-class v3, Ljava/lang/Object;

    invoke-static/range {v0 .. v5}, Lcom/flyersoft/staticlayout/TextUtils;->copySpansFrom(Landroid/text/Spanned;IILjava/lang/Class;Landroid/text/Spannable;I)V

    :cond_6
    add-int/2addr v5, v2

    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 1303
    :cond_7
    new-instance p0, Landroid/text/SpannedString;

    invoke-direct {p0, v4}, Landroid/text/SpannedString;-><init>(Ljava/lang/CharSequence;)V

    return-object p0
.end method

.method public static copySpansFrom(Landroid/text/Spanned;IILjava/lang/Class;Landroid/text/Spannable;I)V
    .locals 5

    if-nez p3, :cond_0

    .line 784
    const-class p3, Ljava/lang/Object;

    .line 787
    :cond_0
    invoke-interface {p0, p1, p2, p3}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p3

    const/4 v0, 0x0

    .line 789
    :goto_0
    array-length v1, p3

    if-ge v0, v1, :cond_3

    .line 790
    aget-object v1, p3, v0

    invoke-interface {p0, v1}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v1

    .line 791
    aget-object v2, p3, v0

    invoke-interface {p0, v2}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v2

    .line 792
    aget-object v3, p3, v0

    invoke-interface {p0, v3}, Landroid/text/Spanned;->getSpanFlags(Ljava/lang/Object;)I

    move-result v3

    if-ge v1, p1, :cond_1

    move v1, p1

    :cond_1
    if-le v2, p2, :cond_2

    move v2, p2

    .line 799
    :cond_2
    aget-object v4, p3, v0

    sub-int/2addr v1, p1

    add-int/2addr v1, p5

    sub-int/2addr v2, p1

    add-int/2addr v2, p5

    invoke-interface {p4, v4, v1, v2, v3}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    return-void
.end method

.method public static ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLcom/flyersoft/staticlayout/TextUtils$TruncateAt;)Ljava/lang/CharSequence;
    .locals 6

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    .line 830
    invoke-static/range {v0 .. v5}, Lcom/flyersoft/staticlayout/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLcom/flyersoft/staticlayout/TextUtils$TruncateAt;ZLcom/flyersoft/staticlayout/TextUtils$EllipsizeCallback;)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method

.method public static ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLcom/flyersoft/staticlayout/TextUtils$TruncateAt;ZLcom/flyersoft/staticlayout/TextUtils$EllipsizeCallback;)Ljava/lang/CharSequence;
    .locals 14

    move-object v0, p1

    move-object/from16 v7, p3

    move-object/from16 v8, p5

    .line 849
    sget-object v2, Lcom/flyersoft/staticlayout/TextUtils;->sEllipsis:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 851
    const-string v2, "..."

    sput-object v2, Lcom/flyersoft/staticlayout/TextUtils;->sEllipsis:Ljava/lang/String;

    .line 854
    :cond_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v3

    .line 859
    instance-of v2, p0, Landroid/text/Spanned;

    const v9, 0xfeff

    const-string v10, ""

    const/high16 v11, 0x40000000    # 2.0f

    const/4 v12, 0x0

    if-nez v2, :cond_e

    .line 860
    invoke-virtual {p1, p0, v12, v3}, Landroid/text/TextPaint;->measureText(Ljava/lang/CharSequence;II)F

    move-result v2

    cmpg-float v2, v2, p2

    if-gtz v2, :cond_1

    if-eqz v8, :cond_11

    .line 864
    invoke-interface {v8, v12, v12}, Lcom/flyersoft/staticlayout/TextUtils$EllipsizeCallback;->ellipsized(II)V

    return-object p0

    .line 870
    :cond_1
    sget-object v2, Lcom/flyersoft/staticlayout/TextUtils;->sEllipsis:Ljava/lang/String;

    invoke-virtual {p1, v2}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v2

    cmpl-float v4, v2, p2

    if-lez v4, :cond_5

    if-eqz v8, :cond_2

    .line 874
    invoke-interface {v8, v12, v3}, Lcom/flyersoft/staticlayout/TextUtils$EllipsizeCallback;->ellipsized(II)V

    :cond_2
    if-eqz p4, :cond_4

    .line 878
    invoke-static {v3}, Lcom/flyersoft/staticlayout/TextUtils;->obtain(I)[C

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v3, :cond_3

    .line 880
    aput-char v9, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 882
    :cond_3
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0, v12, v3}, Ljava/lang/String;-><init>([CII)V

    .line 883
    invoke-static {v0}, Lcom/flyersoft/staticlayout/TextUtils;->recycle([C)V

    return-object v1

    :cond_4
    return-object v10

    .line 890
    :cond_5
    sget-object v4, Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;->START:Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;

    if-ne v7, v4, :cond_8

    sub-float v5, p2, v2

    const/4 v6, 0x0

    const/4 v2, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    .line 891
    invoke-virtual/range {v0 .. v6}, Landroid/text/TextPaint;->breakText(Ljava/lang/CharSequence;IIZF[F)I

    move-result v0

    if-eqz v8, :cond_6

    sub-int v2, v3, v0

    .line 895
    invoke-interface {v8, v12, v2}, Lcom/flyersoft/staticlayout/TextUtils$EllipsizeCallback;->ellipsized(II)V

    :cond_6
    if-eqz p4, :cond_7

    sub-int/2addr v3, v0

    .line 899
    invoke-static {p0, v12, v3}, Lcom/flyersoft/staticlayout/TextUtils;->blank(Ljava/lang/CharSequence;II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 901
    :cond_7
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/flyersoft/staticlayout/TextUtils;->sEllipsis:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    sub-int v0, v3, v0

    invoke-virtual {v1, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 903
    :cond_8
    sget-object v0, Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;->END:Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;

    if-ne v7, v0, :cond_b

    sub-float v5, p2, v2

    const/4 v6, 0x0

    const/4 v2, 0x0

    const/4 v4, 0x1

    move-object v1, p0

    move-object v0, p1

    .line 904
    invoke-virtual/range {v0 .. v6}, Landroid/text/TextPaint;->breakText(Ljava/lang/CharSequence;IIZF[F)I

    move-result v0

    if-eqz v8, :cond_9

    .line 908
    invoke-interface {v8, v0, v3}, Lcom/flyersoft/staticlayout/TextUtils$EllipsizeCallback;->ellipsized(II)V

    :cond_9
    if-eqz p4, :cond_a

    .line 912
    invoke-static {p0, v0, v3}, Lcom/flyersoft/staticlayout/TextUtils;->blank(Ljava/lang/CharSequence;II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 914
    :cond_a
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v12, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Lcom/flyersoft/staticlayout/TextUtils;->sEllipsis:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_b
    sub-float v7, p2, v2

    div-float v5, v7, v11

    const/4 v6, 0x0

    const/4 v2, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v0, p1

    .line 917
    invoke-virtual/range {v0 .. v6}, Landroid/text/TextPaint;->breakText(Ljava/lang/CharSequence;IIZF[F)I

    move-result v2

    move v13, v3

    sub-int v3, v13, v2

    .line 919
    invoke-virtual {p1, p0, v3, v13}, Landroid/text/TextPaint;->measureText(Ljava/lang/CharSequence;II)F

    move-result v2

    sub-float v5, v7, v2

    const/4 v2, 0x0

    const/4 v4, 0x1

    .line 920
    invoke-virtual/range {v0 .. v6}, Landroid/text/TextPaint;->breakText(Ljava/lang/CharSequence;IIZF[F)I

    move-result v0

    if-eqz v8, :cond_c

    .line 924
    invoke-interface {v8, v0, v3}, Lcom/flyersoft/staticlayout/TextUtils$EllipsizeCallback;->ellipsized(II)V

    :cond_c
    if-eqz p4, :cond_d

    .line 928
    invoke-static {p0, v0, v3}, Lcom/flyersoft/staticlayout/TextUtils;->blank(Ljava/lang/CharSequence;II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 930
    :cond_d
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    .line 931
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v12, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Lcom/flyersoft/staticlayout/TextUtils;->sEllipsis:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 932
    invoke-virtual {v1, v3, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_e
    move v13, v3

    mul-int/lit8 v3, v13, 0x2

    .line 945
    new-array v5, v3, [F

    .line 946
    new-instance v1, Landroid/text/TextPaint;

    invoke-direct {v1}, Landroid/text/TextPaint;-><init>()V

    .line 947
    move-object v2, p0

    check-cast v2, Landroid/text/Spanned;

    const/4 v3, 0x0

    :goto_1
    if-ge v3, v13, :cond_f

    .line 951
    const-class v0, Landroid/text/style/MetricAffectingSpan;

    invoke-interface {v2, v3, v13, v0}, Landroid/text/Spanned;->nextSpanTransition(IILjava/lang/Class;)I

    move-result v4

    const/4 v6, 0x0

    move-object v0, p1

    .line 953
    invoke-static/range {v0 .. v6}, Lcom/flyersoft/staticlayout/Styled;->getTextWidths(Landroid/text/TextPaint;Landroid/text/TextPaint;Landroid/text/Spanned;II[FLandroid/graphics/Paint$FontMetricsInt;)I

    add-int v6, v13, v3

    sub-int v3, v4, v3

    .line 954
    invoke-static {v5, v12, v5, v6, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move v3, v4

    goto :goto_1

    :cond_f
    move-object v0, p1

    const/4 v1, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_2
    if-ge v3, v13, :cond_10

    add-int v6, v13, v3

    .line 959
    aget v6, v5, v6

    add-float/2addr v4, v6

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_10
    cmpg-float v3, v4, p2

    if-gtz v3, :cond_12

    if-eqz v8, :cond_11

    .line 964
    invoke-interface {v8, v12, v12}, Lcom/flyersoft/staticlayout/TextUtils$EllipsizeCallback;->ellipsized(II)V

    :cond_11
    return-object p0

    .line 970
    :cond_12
    sget-object v3, Lcom/flyersoft/staticlayout/TextUtils;->sEllipsis:Ljava/lang/String;

    invoke-virtual {p1, v3}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v0

    cmpl-float v3, v0, p2

    if-lez v3, :cond_16

    if-eqz v8, :cond_13

    .line 974
    invoke-interface {v8, v12, v13}, Lcom/flyersoft/staticlayout/TextUtils$EllipsizeCallback;->ellipsized(II)V

    :cond_13
    if-eqz p4, :cond_15

    .line 978
    invoke-static {v13}, Lcom/flyersoft/staticlayout/TextUtils;->obtain(I)[C

    move-result-object v0

    const/4 v1, 0x0

    :goto_3
    if-ge v1, v13, :cond_14

    .line 980
    aput-char v9, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 982
    :cond_14
    new-instance v1, Landroid/text/SpannableString;

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v0, v12, v13}, Ljava/lang/String;-><init>([CII)V

    invoke-direct {v1, v3}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 983
    invoke-static {v0}, Lcom/flyersoft/staticlayout/TextUtils;->recycle([C)V

    .line 984
    const-class v0, Ljava/lang/Object;

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object/from16 p3, v0

    move-object/from16 p4, v1

    move-object p0, v2

    move/from16 p2, v13

    const/4 p1, 0x0

    const/16 p5, 0x0

    invoke-static/range {p0 .. p5}, Lcom/flyersoft/staticlayout/TextUtils;->copySpansFrom(Landroid/text/Spanned;IILjava/lang/Class;Landroid/text/Spannable;I)V

    move-object/from16 v0, p4

    return-object v0

    :cond_15
    return-object v10

    :cond_16
    move v3, v13

    .line 991
    sget-object v4, Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;->START:Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;

    const/4 v6, 0x1

    if-ne v7, v4, :cond_1b

    move v4, v3

    :goto_4
    if-ltz v4, :cond_18

    add-int v7, v3, v4

    sub-int/2addr v7, v6

    .line 996
    aget v7, v5, v7

    add-float/2addr v1, v7

    add-float v7, v1, v0

    cmpl-float v7, v7, p2

    if-lez v7, :cond_17

    goto :goto_5

    :cond_17
    add-int/lit8 v4, v4, -0x1

    goto :goto_4

    :cond_18
    :goto_5
    if-eqz v8, :cond_19

    .line 1006
    invoke-interface {v8, v12, v4}, Lcom/flyersoft/staticlayout/TextUtils$EllipsizeCallback;->ellipsized(II)V

    :cond_19
    if-eqz p4, :cond_1a

    .line 1010
    new-instance v0, Landroid/text/SpannableString;

    invoke-static {p0, v12, v4}, Lcom/flyersoft/staticlayout/TextUtils;->blank(Ljava/lang/CharSequence;II)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 1011
    const-class v1, Ljava/lang/Object;

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object/from16 p4, v0

    move-object/from16 p3, v1

    move-object p0, v2

    move/from16 p2, v3

    const/4 p1, 0x0

    const/16 p5, 0x0

    invoke-static/range {p0 .. p5}, Lcom/flyersoft/staticlayout/TextUtils;->copySpansFrom(Landroid/text/Spanned;IILjava/lang/Class;Landroid/text/Spannable;I)V

    return-object v0

    .line 1014
    :cond_1a
    new-instance v0, Landroid/text/SpannableStringBuilder;

    sget-object v1, Lcom/flyersoft/staticlayout/TextUtils;->sEllipsis:Ljava/lang/String;

    invoke-direct {v0, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 1015
    invoke-virtual {v0, v6, p0, v4, v3}, Landroid/text/SpannableStringBuilder;->insert(ILjava/lang/CharSequence;II)Landroid/text/SpannableStringBuilder;

    return-object v0

    .line 1019
    :cond_1b
    sget-object v4, Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;->END:Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;

    if-ne v7, v4, :cond_20

    const/4 v4, 0x0

    :goto_6
    if-ge v4, v3, :cond_1d

    add-int v6, v3, v4

    .line 1024
    aget v6, v5, v6

    add-float/2addr v1, v6

    add-float v6, v1, v0

    cmpl-float v6, v6, p2

    if-lez v6, :cond_1c

    goto :goto_7

    :cond_1c
    add-int/lit8 v4, v4, 0x1

    goto :goto_6

    :cond_1d
    :goto_7
    if-eqz v8, :cond_1e

    .line 1034
    invoke-interface {v8, v4, v3}, Lcom/flyersoft/staticlayout/TextUtils$EllipsizeCallback;->ellipsized(II)V

    :cond_1e
    if-eqz p4, :cond_1f

    .line 1038
    new-instance v0, Landroid/text/SpannableString;

    invoke-static {p0, v4, v3}, Lcom/flyersoft/staticlayout/TextUtils;->blank(Ljava/lang/CharSequence;II)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 1039
    const-class v1, Ljava/lang/Object;

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object/from16 p4, v0

    move-object/from16 p3, v1

    move-object p0, v2

    move/from16 p2, v3

    const/4 p1, 0x0

    const/16 p5, 0x0

    invoke-static/range {p0 .. p5}, Lcom/flyersoft/staticlayout/TextUtils;->copySpansFrom(Landroid/text/Spanned;IILjava/lang/Class;Landroid/text/Spannable;I)V

    return-object v0

    .line 1042
    :cond_1f
    new-instance v0, Landroid/text/SpannableStringBuilder;

    sget-object v1, Lcom/flyersoft/staticlayout/TextUtils;->sEllipsis:Ljava/lang/String;

    invoke-direct {v0, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 1043
    invoke-virtual {v0, v12, p0, v12, v4}, Landroid/text/SpannableStringBuilder;->insert(ILjava/lang/CharSequence;II)Landroid/text/SpannableStringBuilder;

    return-object v0

    :cond_20
    sub-float v0, p2, v0

    div-float v4, v0, v11

    move v7, v3

    const/4 v9, 0x0

    :goto_8
    if-ltz v7, :cond_22

    add-int v10, v3, v7

    sub-int/2addr v10, v6

    .line 1053
    aget v10, v5, v10

    add-float/2addr v10, v9

    cmpl-float v11, v10, v4

    if-lez v11, :cond_21

    goto :goto_9

    :cond_21
    add-int/lit8 v7, v7, -0x1

    move v9, v10

    goto :goto_8

    :cond_22
    :goto_9
    sub-float/2addr v0, v9

    const/4 v4, 0x0

    :goto_a
    if-ge v4, v7, :cond_24

    add-int v6, v3, v4

    .line 1064
    aget v6, v5, v6

    add-float/2addr v1, v6

    cmpl-float v6, v1, v0

    if-lez v6, :cond_23

    goto :goto_b

    :cond_23
    add-int/lit8 v4, v4, 0x1

    goto :goto_a

    :cond_24
    :goto_b
    if-eqz v8, :cond_25

    .line 1074
    invoke-interface {v8, v4, v7}, Lcom/flyersoft/staticlayout/TextUtils$EllipsizeCallback;->ellipsized(II)V

    :cond_25
    if-eqz p4, :cond_26

    .line 1078
    new-instance v0, Landroid/text/SpannableString;

    invoke-static {p0, v4, v7}, Lcom/flyersoft/staticlayout/TextUtils;->blank(Ljava/lang/CharSequence;II)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 1079
    const-class v1, Ljava/lang/Object;

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object/from16 p4, v0

    move-object/from16 p3, v1

    move-object p0, v2

    move/from16 p2, v3

    const/4 p1, 0x0

    const/16 p5, 0x0

    invoke-static/range {p0 .. p5}, Lcom/flyersoft/staticlayout/TextUtils;->copySpansFrom(Landroid/text/Spanned;IILjava/lang/Class;Landroid/text/Spannable;I)V

    return-object v0

    .line 1082
    :cond_26
    new-instance v0, Landroid/text/SpannableStringBuilder;

    sget-object v1, Lcom/flyersoft/staticlayout/TextUtils;->sEllipsis:Ljava/lang/String;

    invoke-direct {v0, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 1083
    invoke-virtual {v0, v12, p0, v12, v4}, Landroid/text/SpannableStringBuilder;->insert(ILjava/lang/CharSequence;II)Landroid/text/SpannableStringBuilder;

    .line 1084
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v1

    invoke-virtual {v0, v1, p0, v7, v3}, Landroid/text/SpannableStringBuilder;->insert(ILjava/lang/CharSequence;II)Landroid/text/SpannableStringBuilder;

    return-object v0
.end method

.method public static equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z
    .locals 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p0, :cond_4

    if-eqz p1, :cond_4

    .line 446
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-ne v2, v3, :cond_4

    .line 447
    instance-of v3, p0, Ljava/lang/String;

    if-eqz v3, :cond_1

    instance-of v3, p1, Ljava/lang/String;

    if-eqz v3, :cond_1

    .line 448
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_1
    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_3

    .line 451
    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    invoke-interface {p1, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    if-eq v4, v5, :cond_2

    return v1

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    return v0

    :cond_4
    return v1
.end method

.method public static varargs expandTemplate(Ljava/lang/CharSequence;[Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 5

    .line 652
    array-length v0, p1

    const/16 v1, 0x9

    if-gt v0, v1, :cond_5

    .line 656
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0, p0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    const/4 p0, 0x0

    .line 660
    :goto_0
    :try_start_0
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v1

    if-ge p0, v1, :cond_4

    .line 661
    invoke-virtual {v0, p0}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v1

    const/16 v2, 0x5e

    if-ne v1, v2, :cond_3

    add-int/lit8 v1, p0, 0x1

    .line 662
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v3

    if-ne v3, v2, :cond_0

    add-int/lit8 p0, p0, 0x2

    .line 664
    invoke-virtual {v0, v1, p0}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    move p0, v1

    goto :goto_0

    .line 667
    :cond_0
    invoke-static {v3}, Ljava/lang/Character;->isDigit(C)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 668
    invoke-static {v3}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v1
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v2, v1, -0x1

    .line 669
    const-string v3, "template requests value ^"

    if-ltz v2, :cond_2

    .line 673
    :try_start_1
    array-length v4, p1

    if-ge v2, v4, :cond_1

    add-int/lit8 v1, p0, 0x2

    .line 678
    aget-object v3, p1, v2

    invoke-virtual {v0, p0, v1, v3}, Landroid/text/SpannableStringBuilder;->replace(IILjava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 679
    aget-object v1, p1, v2

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    add-int/2addr p0, v1

    goto :goto_0

    .line 674
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "; only "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length p1, p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " provided"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 670
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_1
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_0

    :cond_3
    add-int/lit8 p0, p0, 0x1

    goto :goto_0

    :catch_0
    :cond_4
    return-object v0

    .line 653
    :cond_5
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "max of 9 values are supported"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static getCapsMode(Ljava/lang/CharSequence;II)I
    .locals 6

    and-int/lit16 v0, p2, 0x1000

    if-eqz v0, :cond_0

    const/16 v0, 0x1000

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    and-int/lit16 v1, p2, 0x6000

    if-nez v1, :cond_1

    goto/16 :goto_8

    :cond_1
    :goto_1
    const/16 v1, 0x27

    const/16 v2, 0x22

    if-lez p1, :cond_3

    add-int/lit8 v3, p1, -0x1

    .line 1409
    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    if-eq v3, v2, :cond_2

    if-eq v3, v1, :cond_2

    .line 1412
    invoke-static {v3}, Ljava/lang/Character;->getType(C)I

    move-result v3

    const/16 v4, 0x15

    if-eq v3, v4, :cond_2

    goto :goto_2

    :cond_2
    add-int/lit8 p1, p1, -0x1

    goto :goto_1

    :cond_3
    :goto_2
    move v3, p1

    :goto_3
    if-lez v3, :cond_5

    add-int/lit8 v4, v3, -0x1

    .line 1420
    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    const/16 v5, 0x20

    if-eq v4, v5, :cond_4

    const/16 v5, 0x9

    if-ne v4, v5, :cond_5

    :cond_4
    add-int/lit8 v3, v3, -0x1

    goto :goto_3

    :cond_5
    if-eqz v3, :cond_10

    add-int/lit8 v4, v3, -0x1

    .line 1423
    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    const/16 v5, 0xa

    if-ne v4, v5, :cond_6

    goto :goto_9

    :cond_6
    and-int/lit16 p2, p2, 0x4000

    if-nez p2, :cond_7

    if-eq p1, v3, :cond_f

    or-int/lit16 p0, v0, 0x2000

    return p0

    :cond_7
    if-ne p1, v3, :cond_8

    goto :goto_8

    :cond_8
    :goto_4
    if-lez v3, :cond_a

    add-int/lit8 p1, v3, -0x1

    .line 1443
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p1

    if-eq p1, v2, :cond_9

    if-eq p1, v1, :cond_9

    .line 1446
    invoke-static {p1}, Ljava/lang/Character;->getType(C)I

    move-result p1

    const/16 p2, 0x16

    if-eq p1, p2, :cond_9

    goto :goto_5

    :cond_9
    add-int/lit8 v3, v3, -0x1

    goto :goto_4

    :cond_a
    :goto_5
    if-lez v3, :cond_f

    add-int/lit8 p1, v3, -0x1

    .line 1452
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p1

    const/16 p2, 0x2e

    if-eq p1, p2, :cond_b

    const/16 v1, 0x3f

    if-eq p1, v1, :cond_b

    const/16 v1, 0x21

    if-ne p1, v1, :cond_f

    :cond_b
    if-ne p1, p2, :cond_e

    add-int/lit8 v3, v3, -0x2

    :goto_6
    if-ltz v3, :cond_e

    .line 1460
    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p1

    if-ne p1, p2, :cond_c

    goto :goto_8

    .line 1466
    :cond_c
    invoke-static {p1}, Ljava/lang/Character;->isLetter(C)Z

    move-result p1

    if-nez p1, :cond_d

    goto :goto_7

    :cond_d
    add-int/lit8 v3, v3, -0x1

    goto :goto_6

    :cond_e
    :goto_7
    or-int/lit16 p0, v0, 0x4000

    return p0

    :cond_f
    :goto_8
    return v0

    :cond_10
    :goto_9
    or-int/lit16 p0, v0, 0x2000

    return p0
.end method

.method public static getChars(Ljava/lang/CharSequence;II[CI)V
    .locals 2

    .line 40
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 42
    const-class v1, Ljava/lang/String;

    if-ne v0, v1, :cond_0

    .line 43
    check-cast p0, Ljava/lang/String;

    invoke-virtual {p0, p1, p2, p3, p4}, Ljava/lang/String;->getChars(II[CI)V

    return-void

    .line 44
    :cond_0
    const-class v1, Ljava/lang/StringBuffer;

    if-ne v0, v1, :cond_1

    .line 45
    check-cast p0, Ljava/lang/StringBuffer;

    invoke-virtual {p0, p1, p2, p3, p4}, Ljava/lang/StringBuffer;->getChars(II[CI)V

    return-void

    .line 46
    :cond_1
    const-class v1, Ljava/lang/StringBuilder;

    if-ne v0, v1, :cond_2

    .line 47
    check-cast p0, Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1, p2, p3, p4}, Ljava/lang/StringBuilder;->getChars(II[CI)V

    return-void

    .line 48
    :cond_2
    instance-of v0, p0, Lcom/flyersoft/staticlayout/GetChars;

    if-eqz v0, :cond_3

    .line 49
    check-cast p0, Lcom/flyersoft/staticlayout/GetChars;

    invoke-interface {p0, p1, p2, p3, p4}, Lcom/flyersoft/staticlayout/GetChars;->getChars(II[CI)V

    return-void

    :cond_3
    :goto_0
    if-ge p1, p2, :cond_4

    add-int/lit8 v0, p4, 0x1

    .line 52
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    aput-char v1, p3, p4

    add-int/lit8 p1, p1, 0x1

    move p4, v0

    goto :goto_0

    :cond_4
    return-void
.end method

.method public static getOffsetAfter(Ljava/lang/CharSequence;I)I
    .locals 4

    if-nez p0, :cond_0

    return p1

    .line 729
    :cond_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-ne p1, v0, :cond_1

    goto :goto_0

    :cond_1
    add-int/lit8 v1, v0, -0x1

    if-ne p1, v1, :cond_2

    :goto_0
    return v0

    .line 736
    :cond_2
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    const v1, 0xd800

    if-lt v0, v1, :cond_3

    const v1, 0xdbff

    if-gt v0, v1, :cond_3

    add-int/lit8 v0, p1, 0x1

    .line 739
    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    const v2, 0xdc00

    if-lt v1, v2, :cond_4

    const v2, 0xdfff

    if-gt v1, v2, :cond_4

    add-int/lit8 v0, p1, 0x2

    goto :goto_1

    :cond_3
    add-int/lit8 v0, p1, 0x1

    .line 749
    :cond_4
    :goto_1
    instance-of p1, p0, Landroid/text/Spanned;

    if-eqz p1, :cond_6

    .line 750
    check-cast p0, Landroid/text/Spanned;

    const-class p1, Lcom/flyersoft/staticlayout/ReplacementSpan;

    invoke-interface {p0, v0, v0, p1}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/flyersoft/staticlayout/ReplacementSpan;

    const/4 v1, 0x0

    .line 753
    :goto_2
    array-length v2, p1

    if-ge v1, v2, :cond_6

    .line 754
    aget-object v2, p1, v1

    invoke-interface {p0, v2}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v2

    .line 755
    aget-object v3, p1, v1

    invoke-interface {p0, v3}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v3

    if-ge v2, v0, :cond_5

    if-le v3, v0, :cond_5

    move v0, v3

    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_6
    return v0
.end method

.method public static getOffsetBefore(Ljava/lang/CharSequence;I)I
    .locals 4

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    return v0

    :cond_1
    add-int/lit8 v1, p1, -0x1

    .line 697
    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    const v2, 0xdc00

    if-lt v1, v2, :cond_2

    const v2, 0xdfff

    if-gt v1, v2, :cond_2

    add-int/lit8 v1, p1, -0x2

    .line 700
    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    const v2, 0xd800

    if-lt v1, v2, :cond_2

    const v2, 0xdbff

    if-gt v1, v2, :cond_2

    add-int/lit8 p1, p1, -0x2

    goto :goto_0

    :cond_2
    add-int/lit8 p1, p1, -0x1

    .line 710
    :goto_0
    instance-of v1, p0, Landroid/text/Spanned;

    if-eqz v1, :cond_4

    .line 711
    check-cast p0, Landroid/text/Spanned;

    const-class v1, Lcom/flyersoft/staticlayout/ReplacementSpan;

    invoke-interface {p0, p1, p1, v1}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/flyersoft/staticlayout/ReplacementSpan;

    .line 714
    :goto_1
    array-length v2, v1

    if-ge v0, v2, :cond_4

    .line 715
    aget-object v2, v1, v0

    invoke-interface {p0, v2}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v2

    .line 716
    aget-object v3, v1, v0

    invoke-interface {p0, v3}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v3

    if-ge v2, p1, :cond_3

    if-le v3, p1, :cond_3

    move p1, v2

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_4
    return p1
.end method

.method public static getReverse(Ljava/lang/CharSequence;II)Ljava/lang/CharSequence;
    .locals 1

    .line 462
    new-instance v0, Lcom/flyersoft/staticlayout/TextUtils$Reverser;

    invoke-direct {v0, p0, p1, p2}, Lcom/flyersoft/staticlayout/TextUtils$Reverser;-><init>(Ljava/lang/CharSequence;II)V

    return-object v0
.end method

.method public static getTrimmedLength(Ljava/lang/CharSequence;)I
    .locals 4

    .line 420
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    const/16 v2, 0x20

    if-ge v1, v0, :cond_0

    .line 423
    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    if-gt v3, v2, :cond_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    :goto_1
    if-le v0, v1, :cond_1

    add-int/lit8 v3, v0, -0x1

    .line 428
    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    if-gt v3, v2, :cond_1

    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_1
    sub-int/2addr v0, v1

    return v0
.end method

.method public static htmlEncode(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 1234
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    .line 1236
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_5

    .line 1237
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x22

    if-eq v2, v3, :cond_4

    const/16 v3, 0x3c

    if-eq v2, v3, :cond_3

    const/16 v3, 0x3e

    if-eq v2, v3, :cond_2

    const/16 v3, 0x26

    if-eq v2, v3, :cond_1

    const/16 v3, 0x27

    if-eq v2, v3, :cond_0

    .line 1255
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 1249
    :cond_0
    const-string v2, "&apos;"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 1246
    :cond_1
    const-string v2, "&amp;"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 1243
    :cond_2
    const-string v2, "&gt;"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 1240
    :cond_3
    const-string v2, "&lt;"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 1252
    :cond_4
    const-string v2, "&quot;"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1258
    :cond_5
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static indexOf(Ljava/lang/CharSequence;C)I
    .locals 1

    const/4 v0, 0x0

    .line 57
    invoke-static {p0, p1, v0}, Lcom/flyersoft/staticlayout/TextUtils;->indexOf(Ljava/lang/CharSequence;CI)I

    move-result p0

    return p0
.end method

.method public static indexOf(Ljava/lang/CharSequence;CI)I
    .locals 2

    .line 61
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 63
    const-class v1, Ljava/lang/String;

    if-ne v0, v1, :cond_0

    .line 64
    check-cast p0, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->indexOf(II)I

    move-result p0

    return p0

    .line 66
    :cond_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    invoke-static {p0, p1, p2, v0}, Lcom/flyersoft/staticlayout/TextUtils;->indexOf(Ljava/lang/CharSequence;CII)I

    move-result p0

    return p0
.end method

.method public static indexOf(Ljava/lang/CharSequence;CII)I
    .locals 6

    .line 70
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 72
    instance-of v1, p0, Lcom/flyersoft/staticlayout/GetChars;

    const/4 v2, -0x1

    if-nez v1, :cond_3

    const-class v1, Ljava/lang/StringBuffer;

    if-eq v0, v1, :cond_3

    const-class v1, Ljava/lang/StringBuilder;

    if-eq v0, v1, :cond_3

    const-class v1, Ljava/lang/String;

    if-ne v0, v1, :cond_0

    goto :goto_1

    :cond_0
    :goto_0
    if-ge p2, p3, :cond_2

    .line 100
    invoke-interface {p0, p2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    if-ne v0, p1, :cond_1

    return p2

    :cond_1
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_2
    return v2

    :cond_3
    :goto_1
    const/16 v0, 0x1f4

    .line 75
    invoke-static {v0}, Lcom/flyersoft/staticlayout/TextUtils;->obtain(I)[C

    move-result-object v0

    :goto_2
    if-ge p2, p3, :cond_7

    add-int/lit16 v1, p2, 0x1f4

    if-le v1, p3, :cond_4

    move v1, p3

    :cond_4
    const/4 v3, 0x0

    .line 82
    invoke-static {p0, p2, v1, v0, v3}, Lcom/flyersoft/staticlayout/TextUtils;->getChars(Ljava/lang/CharSequence;II[CI)V

    sub-int v4, v1, p2

    :goto_3
    if-ge v3, v4, :cond_6

    .line 86
    aget-char v5, v0, v3

    if-ne v5, p1, :cond_5

    .line 87
    invoke-static {v0}, Lcom/flyersoft/staticlayout/TextUtils;->recycle([C)V

    add-int/2addr v3, p2

    return v3

    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    :cond_6
    move p2, v1

    goto :goto_2

    .line 95
    :cond_7
    invoke-static {v0}, Lcom/flyersoft/staticlayout/TextUtils;->recycle([C)V

    return v2
.end method

.method public static indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)I
    .locals 2

    const/4 v0, 0x0

    .line 165
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    invoke-static {p0, p1, v0, v1}, Lcom/flyersoft/staticlayout/TextUtils;->indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;II)I

    move-result p0

    return p0
.end method

.method public static indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;I)I
    .locals 1

    .line 169
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    invoke-static {p0, p1, p2, v0}, Lcom/flyersoft/staticlayout/TextUtils;->indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;II)I

    move-result p0

    return p0
.end method

.method public static indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;II)I
    .locals 5

    .line 174
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_0

    return p2

    :cond_0
    const/4 v1, 0x0

    .line 178
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    .line 181
    :goto_0
    invoke-static {p0, v2, p2}, Lcom/flyersoft/staticlayout/TextUtils;->indexOf(Ljava/lang/CharSequence;CI)I

    move-result p2

    sub-int v3, p3, v0

    const/4 v4, -0x1

    if-le p2, v3, :cond_1

    return v4

    :cond_1
    if-gez p2, :cond_2

    return v4

    .line 190
    :cond_2
    invoke-static {p0, p2, p1, v1, v0}, Lcom/flyersoft/staticlayout/TextUtils;->regionMatches(Ljava/lang/CharSequence;ILjava/lang/CharSequence;II)Z

    move-result v3

    if-eqz v3, :cond_3

    return p2

    :cond_3
    add-int/lit8 p2, p2, 0x1

    goto :goto_0
.end method

.method public static isDigitsOnly(Ljava/lang/CharSequence;)Z
    .locals 4

    .line 1344
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    .line 1346
    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isDigit(C)Z

    move-result v3

    if-nez v3, :cond_0

    return v1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method public static isEmpty(Ljava/lang/CharSequence;)Z
    .locals 0

    if-eqz p0, :cond_1

    .line 408
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result p0

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public static isGraphic(C)Z
    .locals 1

    .line 1330
    invoke-static {p0}, Ljava/lang/Character;->getType(C)I

    move-result p0

    const/16 v0, 0xf

    if-eq p0, v0, :cond_0

    const/16 v0, 0x10

    if-eq p0, v0, :cond_0

    const/16 v0, 0x13

    if-eq p0, v0, :cond_0

    if-eqz p0, :cond_0

    const/16 v0, 0xd

    if-eq p0, v0, :cond_0

    const/16 v0, 0xe

    if-eq p0, v0, :cond_0

    const/16 v0, 0xc

    if-eq p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isGraphic(Ljava/lang/CharSequence;)Z
    .locals 5

    .line 1310
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    .line 1312
    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->getType(C)I

    move-result v3

    const/16 v4, 0xf

    if-eq v3, v4, :cond_0

    const/16 v4, 0x10

    if-eq v3, v4, :cond_0

    const/16 v4, 0x13

    if-eq v3, v4, :cond_0

    if-eqz v3, :cond_0

    const/16 v4, 0xd

    if-eq v3, v4, :cond_0

    const/16 v4, 0xe

    if-eq v3, v4, :cond_0

    const/16 v4, 0xc

    if-eq v3, v4, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method public static join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;
    .locals 3

    .line 267
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 269
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v1, 0x1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto :goto_1

    .line 273
    :cond_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 275
    :goto_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 277
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 6

    .line 248
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 250
    array-length v1, p1

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v1, :cond_1

    aget-object v5, p1, v4

    if-eqz v2, :cond_0

    const/4 v2, 0x0

    goto :goto_1

    .line 254
    :cond_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 256
    :goto_1
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 258
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static lastIndexOf(Ljava/lang/CharSequence;C)I
    .locals 1

    .line 107
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-static {p0, p1, v0}, Lcom/flyersoft/staticlayout/TextUtils;->lastIndexOf(Ljava/lang/CharSequence;CI)I

    move-result p0

    return p0
.end method

.method public static lastIndexOf(Ljava/lang/CharSequence;CI)I
    .locals 2

    .line 111
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 113
    const-class v1, Ljava/lang/String;

    if-ne v0, v1, :cond_0

    .line 114
    check-cast p0, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->lastIndexOf(II)I

    move-result p0

    return p0

    :cond_0
    const/4 v0, 0x0

    .line 116
    invoke-static {p0, p1, v0, p2}, Lcom/flyersoft/staticlayout/TextUtils;->lastIndexOf(Ljava/lang/CharSequence;CII)I

    move-result p0

    return p0
.end method

.method public static lastIndexOf(Ljava/lang/CharSequence;CII)I
    .locals 4

    const/4 v0, -0x1

    if-gez p3, :cond_0

    return v0

    .line 123
    :cond_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-lt p3, v1, :cond_1

    .line 124
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result p3

    add-int/lit8 p3, p3, -0x1

    :cond_1
    add-int/lit8 v1, p3, 0x1

    .line 128
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    .line 130
    instance-of v3, p0, Lcom/flyersoft/staticlayout/GetChars;

    if-nez v3, :cond_5

    const-class v3, Ljava/lang/StringBuffer;

    if-eq v2, v3, :cond_5

    const-class v3, Ljava/lang/StringBuilder;

    if-eq v2, v3, :cond_5

    const-class v3, Ljava/lang/String;

    if-ne v2, v3, :cond_2

    goto :goto_1

    :cond_2
    :goto_0
    if-lt p3, p2, :cond_4

    .line 158
    invoke-interface {p0, p3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    if-ne v1, p1, :cond_3

    return p3

    :cond_3
    add-int/lit8 p3, p3, -0x1

    goto :goto_0

    :cond_4
    return v0

    :cond_5
    :goto_1
    const/16 p3, 0x1f4

    .line 133
    invoke-static {p3}, Lcom/flyersoft/staticlayout/TextUtils;->obtain(I)[C

    move-result-object p3

    :goto_2
    if-ge p2, v1, :cond_9

    add-int/lit16 v2, v1, -0x1f4

    if-ge v2, p2, :cond_6

    move v2, p2

    :cond_6
    const/4 v3, 0x0

    .line 140
    invoke-static {p0, v2, v1, p3, v3}, Lcom/flyersoft/staticlayout/TextUtils;->getChars(Ljava/lang/CharSequence;II[CI)V

    sub-int/2addr v1, v2

    add-int/lit8 v1, v1, -0x1

    :goto_3
    if-ltz v1, :cond_8

    .line 144
    aget-char v3, p3, v1

    if-ne v3, p1, :cond_7

    .line 145
    invoke-static {p3}, Lcom/flyersoft/staticlayout/TextUtils;->recycle([C)V

    add-int/2addr v1, v2

    return v1

    :cond_7
    add-int/lit8 v1, v1, -0x1

    goto :goto_3

    :cond_8
    move v1, v2

    goto :goto_2

    .line 153
    :cond_9
    invoke-static {p3}, Lcom/flyersoft/staticlayout/TextUtils;->recycle([C)V

    return v0
.end method

.method static obtain(I)[C
    .locals 3

    .line 1208
    sget-object v0, Lcom/flyersoft/staticlayout/TextUtils;->sLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1209
    :try_start_0
    sget-object v1, Lcom/flyersoft/staticlayout/TextUtils;->sTemp:[C

    const/4 v2, 0x0

    .line 1210
    sput-object v2, Lcom/flyersoft/staticlayout/TextUtils;->sTemp:[C

    .line 1211
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_1

    .line 1213
    array-length v0, v1

    if-ge v0, p0, :cond_0

    goto :goto_0

    :cond_0
    return-object v1

    .line 1214
    :cond_1
    :goto_0
    invoke-static {p0}, Lcom/flyersoft/staticlayout/ArrayUtils;->idealCharArraySize(I)I

    move-result p0

    new-array p0, p0, [C

    return-object p0

    :catchall_0
    move-exception p0

    .line 1211
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method private static readSpan(Landroid/os/Parcel;Landroid/text/Spannable;Ljava/lang/Object;)V
    .locals 2

    .line 766
    invoke-virtual {p0}, Landroid/os/Parcel;->readInt()I

    move-result v0

    invoke-virtual {p0}, Landroid/os/Parcel;->readInt()I

    move-result v1

    invoke-virtual {p0}, Landroid/os/Parcel;->readInt()I

    move-result p0

    invoke-interface {p1, p2, v0, v1, p0}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    return-void
.end method

.method static recycle([C)V
    .locals 2

    .line 1220
    array-length v0, p0

    const/16 v1, 0x3e8

    if-le v0, v1, :cond_0

    return-void

    .line 1223
    :cond_0
    sget-object v0, Lcom/flyersoft/staticlayout/TextUtils;->sLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1224
    :try_start_0
    sput-object p0, Lcom/flyersoft/staticlayout/TextUtils;->sTemp:[C

    .line 1225
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public static regionMatches(Ljava/lang/CharSequence;ILjava/lang/CharSequence;II)Z
    .locals 3

    mul-int/lit8 v0, p4, 0x2

    .line 202
    invoke-static {v0}, Lcom/flyersoft/staticlayout/TextUtils;->obtain(I)[C

    move-result-object v0

    add-int v1, p1, p4

    const/4 v2, 0x0

    .line 204
    invoke-static {p0, p1, v1, v0, v2}, Lcom/flyersoft/staticlayout/TextUtils;->getChars(Ljava/lang/CharSequence;II[CI)V

    add-int p0, p3, p4

    .line 205
    invoke-static {p2, p3, p0, v0, p4}, Lcom/flyersoft/staticlayout/TextUtils;->getChars(Ljava/lang/CharSequence;II[CI)V

    const/4 p0, 0x0

    :goto_0
    if-ge p0, p4, :cond_1

    .line 209
    aget-char p1, v0, p0

    add-int p2, p0, p4

    aget-char p2, v0, p2

    if-eq p1, p2, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 p0, p0, 0x1

    goto :goto_0

    :cond_1
    const/4 v2, 0x1

    .line 215
    :goto_1
    invoke-static {v0}, Lcom/flyersoft/staticlayout/TextUtils;->recycle([C)V

    return v2
.end method

.method public static replace(Ljava/lang/CharSequence;[Ljava/lang/String;[Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 6

    .line 607
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0, p0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    const/4 p0, 0x0

    const/4 v1, 0x0

    .line 609
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_1

    .line 610
    aget-object v2, p1, v1

    invoke-static {v0, v2}, Lcom/flyersoft/staticlayout/TextUtils;->indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)I

    move-result v2

    if-ltz v2, :cond_0

    .line 613
    aget-object v3, p1, v1

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v4, v2

    const/16 v5, 0x21

    invoke-virtual {v0, v3, v2, v4, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 617
    :cond_1
    :goto_1
    array-length v1, p1

    if-ge p0, v1, :cond_3

    .line 618
    aget-object v1, p1, p0

    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->getSpanStart(Ljava/lang/Object;)I

    move-result v1

    .line 619
    aget-object v2, p1, p0

    invoke-virtual {v0, v2}, Landroid/text/SpannableStringBuilder;->getSpanEnd(Ljava/lang/Object;)I

    move-result v2

    if-ltz v1, :cond_2

    .line 622
    aget-object v3, p2, p0

    invoke-virtual {v0, v1, v2, v3}, Landroid/text/SpannableStringBuilder;->replace(IILjava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    :cond_2
    add-int/lit8 p0, p0, 0x1

    goto :goto_1

    :cond_3
    return-object v0
.end method

.method public static split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .locals 1

    .line 291
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    .line 292
    sget-object p0, Lcom/flyersoft/staticlayout/TextUtils;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    return-object p0

    :cond_0
    const/4 v0, -0x1

    .line 294
    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static split(Ljava/lang/String;Ljava/util/regex/Pattern;)[Ljava/lang/String;
    .locals 1

    .line 308
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    .line 309
    sget-object p0, Lcom/flyersoft/staticlayout/TextUtils;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    return-object p0

    :cond_0
    const/4 v0, -0x1

    .line 311
    invoke-virtual {p1, p0, v0}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;I)[Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static stringOrSpannedString(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 1

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 394
    :cond_0
    instance-of v0, p0, Landroid/text/SpannedString;

    if-eqz v0, :cond_1

    return-object p0

    .line 396
    :cond_1
    instance-of v0, p0, Landroid/text/Spanned;

    if-eqz v0, :cond_2

    .line 397
    new-instance v0, Landroid/text/SpannedString;

    invoke-direct {v0, p0}, Landroid/text/SpannedString;-><init>(Ljava/lang/CharSequence;)V

    return-object v0

    .line 399
    :cond_2
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static substring(Ljava/lang/CharSequence;II)Ljava/lang/String;
    .locals 3

    .line 227
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 228
    check-cast p0, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 229
    :cond_0
    instance-of v0, p0, Ljava/lang/StringBuilder;

    if-eqz v0, :cond_1

    .line 230
    check-cast p0, Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 231
    :cond_1
    instance-of v0, p0, Ljava/lang/StringBuffer;

    if-eqz v0, :cond_2

    .line 232
    check-cast p0, Ljava/lang/StringBuffer;

    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuffer;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    sub-int v0, p2, p1

    .line 234
    invoke-static {v0}, Lcom/flyersoft/staticlayout/TextUtils;->obtain(I)[C

    move-result-object v1

    const/4 v2, 0x0

    .line 235
    invoke-static {p0, p1, p2, v1, v2}, Lcom/flyersoft/staticlayout/TextUtils;->getChars(Ljava/lang/CharSequence;II[CI)V

    .line 236
    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, v1, v2, v0}, Ljava/lang/String;-><init>([CII)V

    .line 237
    invoke-static {v1}, Lcom/flyersoft/staticlayout/TextUtils;->recycle([C)V

    return-object p0
.end method

.method public static writeToParcel(Ljava/lang/CharSequence;Landroid/os/Parcel;I)V
    .locals 6

    .line 555
    instance-of v0, p0, Landroid/text/Spanned;

    if-eqz v0, :cond_3

    const/4 v0, 0x0

    .line 556
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 557
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 559
    move-object v1, p0

    check-cast v1, Landroid/text/Spanned;

    .line 560
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result p0

    const-class v2, Ljava/lang/Object;

    invoke-interface {v1, v0, p0, v2}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p0

    const/4 v2, 0x0

    .line 567
    :goto_0
    array-length v3, p0

    if-ge v2, v3, :cond_2

    .line 568
    aget-object v3, p0, v2

    .line 571
    instance-of v4, v3, Landroid/text/style/CharacterStyle;

    if-eqz v4, :cond_0

    .line 572
    move-object v4, v3

    check-cast v4, Landroid/text/style/CharacterStyle;

    invoke-virtual {v4}, Landroid/text/style/CharacterStyle;->getUnderlying()Landroid/text/style/CharacterStyle;

    move-result-object v4

    goto :goto_1

    :cond_0
    move-object v4, v3

    .line 575
    :goto_1
    instance-of v5, v4, Landroid/text/ParcelableSpan;

    if-eqz v5, :cond_1

    .line 576
    check-cast v4, Landroid/text/ParcelableSpan;

    .line 577
    invoke-interface {v4}, Landroid/text/ParcelableSpan;->getSpanTypeId()I

    move-result v5

    invoke-virtual {p1, v5}, Landroid/os/Parcel;->writeInt(I)V

    .line 578
    invoke-interface {v4, p1, p2}, Landroid/text/ParcelableSpan;->writeToParcel(Landroid/os/Parcel;I)V

    .line 579
    invoke-static {p1, v1, v3}, Lcom/flyersoft/staticlayout/TextUtils;->writeWhere(Landroid/os/Parcel;Landroid/text/Spanned;Ljava/lang/Object;)V

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 583
    :cond_2
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    return-void

    :cond_3
    const/4 p2, 0x1

    .line 585
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    if-eqz p0, :cond_4

    .line 587
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void

    :cond_4
    const/4 p0, 0x0

    .line 589
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method

.method private static writeWhere(Landroid/os/Parcel;Landroid/text/Spanned;Ljava/lang/Object;)V
    .locals 1

    .line 595
    invoke-interface {p1, p2}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 596
    invoke-interface {p1, p2}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 597
    invoke-interface {p1, p2}, Landroid/text/Spanned;->getSpanFlags(Ljava/lang/Object;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
