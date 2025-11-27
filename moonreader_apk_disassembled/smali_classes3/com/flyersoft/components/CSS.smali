.class public Lcom/flyersoft/components/CSS;
.super Ljava/lang/Object;
.source "CSS.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/components/CSS$Style;,
        Lcom/flyersoft/components/CSS$BackgroundColorSpan;,
        Lcom/flyersoft/components/CSS$PAGE_BREAK;
    }
.end annotation


# static fields
.field public static final ALIGN_CENTER:I = 0x3

.field public static final ALIGN_JUSTIFY:I = 0x2

.field public static final ALIGN_LEFT:I = 0x1

.field public static final ALIGN_RIGHT:I = 0x4

.field public static final FLOAT_ADDED:F = 6.0f

.field public static final KEEP_MAGIN:F = 0.35f

.field public static final LINK_COLOR:I = -0x9f9f1c

.field public static final LINK_VISITED_COLOR:I = -0x666634

.field public static final ZERO_FONTSIZE:F = 0.001f

.field public static em2:Ljava/lang/Float; = null

.field public static final no_margin:F = -999.0f


# instance fields
.field public cacheStyles:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/flyersoft/components/CSS$Style;",
            ">;"
        }
    .end annotation
.end field

.field public link_color:Ljava/lang/Integer;

.field public link_no_underline:Z

.field public link_visited_color:Ljava/lang/Integer;

.field public styles:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/flyersoft/components/CSS$Style;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/components/CSS;->styles:Ljava/util/HashMap;

    .line 49
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/components/CSS;->cacheStyles:Ljava/util/HashMap;

    .line 51
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 52
    invoke-virtual {p0, p1}, Lcom/flyersoft/components/CSS;->scanTextForStyles(Ljava/lang/String;)V

    .line 53
    invoke-direct {p0}, Lcom/flyersoft/components/CSS;->checkLinkStyle()V

    return-void
.end method

.method public static EM()F
    .locals 1

    .line 1263
    sget v0, Lcom/flyersoft/tools/A;->fontSize:F

    invoke-static {v0}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v0

    return v0
.end method

.method public static EM2()F
    .locals 2

    .line 1268
    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    if-nez v0, :cond_0

    .line 1269
    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v0

    return v0

    .line 1270
    :cond_0
    sget-object v0, Lcom/flyersoft/components/CSS;->em2:Ljava/lang/Float;

    if-nez v0, :cond_1

    .line 1271
    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    const-string v1, "\u4e00"

    invoke-static {v1, v0}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/CSS;->em2:Ljava/lang/Float;

    .line 1272
    :cond_1
    sget-object v0, Lcom/flyersoft/components/CSS;->em2:Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    return v0
.end method

.method public static EM_no_density()F
    .locals 1

    .line 1276
    sget v0, Lcom/flyersoft/tools/A;->fontSize:F

    return v0
.end method

.method public static MARGIN_HORI()F
    .locals 1

    .line 1281
    sget-boolean v0, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz v0, :cond_0

    const v0, 0x3f99999a    # 1.2f

    return v0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    return v0
.end method

.method public static MARGIN_VERT()F
    .locals 2

    .line 1285
    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getLineHeight2()I

    move-result v0

    int-to-float v0, v0

    goto :goto_0

    :cond_0
    sget v0, Lcom/flyersoft/tools/A;->fontSize:F

    invoke-static {v0}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v0

    .line 1286
    :goto_0
    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v1

    div-float/2addr v0, v1

    return v0
.end method

.method public static borderStyleOk(Ljava/lang/String;)Z
    .locals 2

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 1361
    :cond_0
    const-string v1, "none"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    return v0
.end method

.method private checkLinkStyle()V
    .locals 3

    .line 131
    iget-object v0, p0, Lcom/flyersoft/components/CSS;->styles:Ljava/util/HashMap;

    const-string v1, "a"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/CSS$Style;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 133
    iget-object v2, v0, Lcom/flyersoft/components/CSS$Style;->color:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getHtmlColor(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, p0, Lcom/flyersoft/components/CSS;->link_color:Ljava/lang/Integer;

    .line 134
    iget-object v0, v0, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/components/CSS;->urlNoUnderline(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 135
    iput-boolean v1, p0, Lcom/flyersoft/components/CSS;->link_no_underline:Z

    .line 138
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/CSS;->styles:Ljava/util/HashMap;

    const-string v2, "a:link"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/CSS$Style;

    if-nez v0, :cond_1

    .line 140
    iget-object v0, p0, Lcom/flyersoft/components/CSS;->styles:Ljava/util/HashMap;

    const-string v2, "a.link"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/CSS$Style;

    :cond_1
    if-eqz v0, :cond_2

    .line 142
    iget-object v2, v0, Lcom/flyersoft/components/CSS$Style;->color:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getHtmlColor(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, p0, Lcom/flyersoft/components/CSS;->link_color:Ljava/lang/Integer;

    .line 143
    iget-object v0, v0, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/components/CSS;->urlNoUnderline(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 144
    iput-boolean v1, p0, Lcom/flyersoft/components/CSS;->link_no_underline:Z

    .line 148
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/components/CSS;->styles:Ljava/util/HashMap;

    const-string v1, "a:visited"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/CSS$Style;

    if-nez v0, :cond_3

    .line 150
    iget-object v0, p0, Lcom/flyersoft/components/CSS;->styles:Ljava/util/HashMap;

    const-string v1, "a.visited"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/CSS$Style;

    :cond_3
    if-eqz v0, :cond_4

    .line 152
    iget-object v0, v0, Lcom/flyersoft/components/CSS$Style;->color:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getHtmlColor(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/CSS;->link_visited_color:Ljava/lang/Integer;

    :cond_4
    return-void
.end method

.method private deleteComments(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 110
    const-string v0, "\r"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 111
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    .line 114
    :cond_0
    const-string v2, "/*"

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_1

    .line 116
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 119
    :cond_1
    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    const-string v1, "*/"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    if-ne v1, v3, :cond_2

    goto :goto_0

    :cond_2
    add-int/lit8 v1, v1, 0x2

    .line 124
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-lt v1, v2, :cond_0

    .line 127
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public static emptyMargin()Landroid/graphics/RectF;
    .locals 2

    .line 1293
    new-instance v0, Landroid/graphics/RectF;

    const v1, -0x3b864000    # -999.0f

    invoke-direct {v0, v1, v1, v1, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object v0
.end method

.method public static getBorder([Ljava/lang/String;Landroid/graphics/RectF;I)F
    .locals 3

    const/4 v0, 0x2

    const/4 v1, 0x1

    const v2, -0x3b864000    # -999.0f

    if-eqz p1, :cond_3

    if-nez p2, :cond_0

    .line 1332
    iget p1, p1, Landroid/graphics/RectF;->left:F

    goto :goto_0

    :cond_0
    if-ne p2, v1, :cond_1

    iget p1, p1, Landroid/graphics/RectF;->top:F

    goto :goto_0

    :cond_1
    if-ne p2, v0, :cond_2

    iget p1, p1, Landroid/graphics/RectF;->right:F

    goto :goto_0

    :cond_2
    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    goto :goto_0

    :cond_3
    const p1, -0x3b864000    # -999.0f

    :goto_0
    cmpl-float v2, p1, v2

    if-nez v2, :cond_8

    const/4 p1, 0x0

    if-nez p0, :cond_4

    return p1

    :cond_4
    if-nez p2, :cond_5

    const/4 p2, 0x0

    .line 1336
    aget-object p0, p0, p2

    goto :goto_1

    :cond_5
    if-ne p2, v1, :cond_6

    aget-object p0, p0, v1

    goto :goto_1

    :cond_6
    if-ne p2, v0, :cond_7

    aget-object p0, p0, v0

    goto :goto_1

    :cond_7
    const/4 p2, 0x3

    aget-object p0, p0, p2

    .line 1337
    :goto_1
    invoke-static {p0}, Lcom/flyersoft/components/CSS;->borderStyleOk(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_8

    .line 1338
    const-string p0, "medium"

    invoke-static {p0}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result p0

    return p0

    :cond_8
    return p1
.end method

.method public static getBorderSize(Ljava/lang/String;)F
    .locals 1

    .line 1022
    const-string v0, "thin"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/high16 p0, 0x3f800000    # 1.0f

    .line 1023
    invoke-static {}, Lcom/flyersoft/components/CSS;->EM_no_density()F

    move-result v0

    :goto_0
    div-float/2addr p0, v0

    return p0

    .line 1024
    :cond_0
    const-string v0, "medium"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/high16 p0, 0x40000000    # 2.0f

    .line 1025
    invoke-static {}, Lcom/flyersoft/components/CSS;->EM_no_density()F

    move-result v0

    goto :goto_0

    .line 1026
    :cond_1
    const-string v0, "thick"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/high16 p0, 0x40800000    # 4.0f

    .line 1027
    invoke-static {}, Lcom/flyersoft/components/CSS;->EM_no_density()F

    move-result v0

    goto :goto_0

    .line 1029
    :cond_2
    invoke-static {p0}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result p0

    return p0
.end method

.method private getClassName(Ljava/lang/String;I)Ljava/util/ArrayList;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 166
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x1

    .line 167
    invoke-static {p1, p2, v1}, Lcom/flyersoft/components/CSS;->priorNotSplit(Ljava/lang/String;IZ)I

    move-result p2

    move v2, p2

    :goto_0
    if-lez p2, :cond_3

    add-int/lit8 v3, p2, -0x1

    .line 171
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x2c

    if-ne v4, v5, :cond_0

    add-int/lit8 v2, v2, 0x1

    .line 172
    invoke-virtual {p1, p2, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/flyersoft/components/CSS;->trimClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 p2, p2, -0x2

    move v2, p2

    .line 175
    :cond_0
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result p2

    const/16 v4, 0x7d

    if-eq p2, v4, :cond_2

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result p2

    const/16 v4, 0x3b

    if-eq p2, v4, :cond_2

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result p2

    const/16 v4, 0x2f

    if-ne p2, v4, :cond_1

    goto :goto_1

    :cond_1
    move p2, v3

    goto :goto_0

    :cond_2
    :goto_1
    move p2, v3

    :cond_3
    if-nez p2, :cond_4

    .line 178
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const v4, 0xfeff

    if-ne v3, v4, :cond_4

    add-int/lit8 p2, p2, 0x1

    :cond_4
    add-int/2addr v2, v1

    .line 179
    invoke-virtual {p1, p2, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/flyersoft/components/CSS;->trimClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 181
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    sub-int/2addr p1, v1

    :goto_2
    if-ltz p1, :cond_7

    .line 182
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    .line 183
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_5

    const-string v1, "@"

    .line 184
    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string v1, ":"

    .line 186
    invoke-virtual {p2, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_6

    const-string v1, "a:"

    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_6

    .line 188
    :cond_5
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_6
    add-int/lit8 p1, p1, -0x1

    goto :goto_2

    :cond_7
    return-object v0
.end method

.method public static getCssSize(Ljava/lang/String;Z)F
    .locals 3

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 1059
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 1060
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    return v0

    :cond_1
    const/4 v1, 0x0

    .line 1062
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x2d

    if-ne v1, v2, :cond_2

    return v0

    :cond_2
    if-eqz p1, :cond_d

    .line 1066
    const-string v0, "xxx-small"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const p0, 0x3ef0a3d7    # 0.47f

    return p0

    .line 1068
    :cond_3
    const-string v0, "xx-small"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const p0, 0x3f11eb85    # 0.57f

    return p0

    .line 1070
    :cond_4
    const-string v0, "x-small"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const p0, 0x3f333333    # 0.7f

    return p0

    .line 1072
    :cond_5
    const-string v0, "small"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    const p0, 0x3f51eb85    # 0.82f

    return p0

    .line 1074
    :cond_6
    const-string v0, "medium"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    const/high16 p0, 0x3f800000    # 1.0f

    return p0

    .line 1076
    :cond_7
    const-string v0, "large"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    const p0, 0x3f970a3d    # 1.18f

    return p0

    .line 1078
    :cond_8
    const-string v0, "x-large"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    const p0, 0x3fb851ec    # 1.44f

    return p0

    .line 1080
    :cond_9
    const-string v0, "xx-large"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    const/high16 p0, 0x3fe00000    # 1.75f

    return p0

    .line 1082
    :cond_a
    const-string v0, "xxx-large"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    const p0, 0x3ff9999a    # 1.95f

    return p0

    .line 1084
    :cond_b
    const-string v0, "smaller"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    const p0, 0x3f553f7d    # 0.833f

    return p0

    .line 1086
    :cond_c
    const-string v0, "larger"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    const p0, 0x3f99999a    # 1.2f

    return p0

    .line 1090
    :cond_d
    invoke-static {p0}, Lcom/flyersoft/tools/T;->string2Float(Ljava/lang/String;)F

    move-result v0

    .line 1091
    const-string v1, "em"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_e

    goto :goto_1

    .line 1093
    :cond_e
    const-string v1, "px"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    const/high16 v2, 0x41800000    # 16.0f

    if-eqz v1, :cond_10

    :cond_f
    div-float/2addr v0, v2

    goto :goto_1

    .line 1095
    :cond_10
    const-string v1, "pt"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_11

    const/high16 p0, 0x41400000    # 12.0f

    :goto_0
    div-float/2addr v0, p0

    goto :goto_1

    .line 1097
    :cond_11
    const-string v1, "%"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_f

    const/high16 p0, 0x42c80000    # 100.0f

    goto :goto_0

    :goto_1
    if-eqz p1, :cond_12

    const/high16 p0, 0x40800000    # 4.0f

    cmpl-float p1, v0, p0

    if-lez p1, :cond_12

    return p0

    :cond_12
    return v0
.end method

.method public static getEmSize(Ljava/lang/String;)F
    .locals 3

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 1035
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 1036
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    return v0

    .line 1038
    :cond_1
    invoke-static {p0}, Lcom/flyersoft/tools/T;->string2Float(Ljava/lang/String;)F

    move-result v0

    .line 1039
    const-string v1, "%"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1040
    invoke-static {}, Lcom/flyersoft/tools/A;->getPageWidth()I

    move-result p0

    int-to-float p0, p0

    mul-float v0, v0, p0

    const/high16 p0, 0x42d20000    # 105.0f

    div-float/2addr v0, p0

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result p0

    div-float/2addr v0, p0

    return v0

    .line 1041
    :cond_2
    const-string v1, "em"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    return v0

    .line 1043
    :cond_3
    const-string v1, "px"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    const/high16 v2, 0x41800000    # 16.0f

    if-eqz v1, :cond_4

    div-float/2addr v0, v2

    return v0

    .line 1045
    :cond_4
    const-string v1, "pt"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_5

    const/high16 p0, 0x41400000    # 12.0f

    div-float/2addr v0, p0

    return v0

    .line 1047
    :cond_5
    const-string v1, "in"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_6

    const/high16 p0, 0x40c00000    # 6.0f

    mul-float v0, v0, p0

    return v0

    .line 1049
    :cond_6
    const-string v1, "cm"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_7

    const/high16 p0, 0x40000000    # 2.0f

    mul-float v0, v0, p0

    return v0

    :cond_7
    div-float/2addr v0, v2

    return v0
.end method

.method public static getMargin(Landroid/graphics/RectF;Ljava/lang/String;I)F
    .locals 3

    const/4 v0, 0x2

    const/4 v1, 0x1

    const v2, -0x3b864000    # -999.0f

    if-eqz p0, :cond_3

    if-nez p2, :cond_0

    .line 1299
    iget p0, p0, Landroid/graphics/RectF;->left:F

    goto :goto_0

    :cond_0
    if-ne p2, v1, :cond_1

    iget p0, p0, Landroid/graphics/RectF;->top:F

    goto :goto_0

    :cond_1
    if-ne p2, v0, :cond_2

    iget p0, p0, Landroid/graphics/RectF;->right:F

    goto :goto_0

    :cond_2
    iget p0, p0, Landroid/graphics/RectF;->bottom:F

    goto :goto_0

    :cond_3
    const p0, -0x3b864000    # -999.0f

    :goto_0
    cmpl-float v2, p0, v2

    if-nez v2, :cond_b

    .line 1301
    const-string p0, "blockquote"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_6

    if-eqz p2, :cond_5

    if-ne p2, v0, :cond_4

    goto :goto_1

    .line 1302
    :cond_4
    invoke-static {}, Lcom/flyersoft/components/CSS;->MARGIN_VERT()F

    move-result p0

    return p0

    :cond_5
    :goto_1
    invoke-static {}, Lcom/flyersoft/components/CSS;->MARGIN_HORI()F

    move-result p0

    return p0

    .line 1303
    :cond_6
    const-string p0, "p"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    const/4 v0, 0x3

    if-eqz p0, :cond_8

    if-eq p2, v1, :cond_7

    if-ne p2, v0, :cond_8

    :cond_7
    const/high16 p0, 0x3f800000    # 1.0f

    return p0

    .line 1305
    :cond_8
    invoke-static {p1}, Lcom/flyersoft/components/CSS;->isHeaderTag(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_a

    if-eq p2, v1, :cond_9

    if-ne p2, v0, :cond_a

    .line 1306
    :cond_9
    invoke-static {}, Lcom/flyersoft/components/CSS;->MARGIN_VERT()F

    move-result p0

    const p1, 0x3f547ae1    # 0.83f

    mul-float p0, p0, p1

    return p0

    :cond_a
    const/4 p0, 0x0

    :cond_b
    return p0
.end method

.method public static getPadding(Landroid/graphics/RectF;I)F
    .locals 2

    const v0, -0x3b864000    # -999.0f

    if-eqz p0, :cond_3

    if-nez p1, :cond_0

    .line 1316
    iget p0, p0, Landroid/graphics/RectF;->left:F

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    iget p0, p0, Landroid/graphics/RectF;->top:F

    goto :goto_0

    :cond_1
    const/4 v1, 0x2

    if-ne p1, v1, :cond_2

    iget p0, p0, Landroid/graphics/RectF;->right:F

    goto :goto_0

    :cond_2
    iget p0, p0, Landroid/graphics/RectF;->bottom:F

    goto :goto_0

    :cond_3
    const p0, -0x3b864000    # -999.0f

    :goto_0
    cmpl-float p1, p0, v0

    if-nez p1, :cond_4

    const/4 p0, 0x0

    :cond_4
    return p0
.end method

.method public static hasBorder(Lcom/flyersoft/components/CSS$Style;)Z
    .locals 5

    const/4 v0, 0x0

    if-eqz p0, :cond_4

    .line 1346
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    if-nez v1, :cond_0

    goto :goto_0

    .line 1348
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    const/4 v2, 0x0

    const/4 v3, 0x1

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-static {v1}, Lcom/flyersoft/components/CSS;->borderStyleOk(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    return v3

    .line 1350
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v1, v1, v3

    invoke-static {v1}, Lcom/flyersoft/components/CSS;->borderStyleOk(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    return v3

    .line 1352
    :cond_2
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->right:F

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    const/4 v4, 0x2

    aget-object v1, v1, v4

    invoke-static {v1}, Lcom/flyersoft/components/CSS;->borderStyleOk(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    return v3

    .line 1354
    :cond_3
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_4

    iget-object p0, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    const/4 v1, 0x3

    aget-object p0, p0, v1

    invoke-static {p0}, Lcom/flyersoft/components/CSS;->borderStyleOk(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_4

    return v3

    :cond_4
    :goto_0
    return v0
.end method

.method public static hasBorderOrBackgroundColor(Lcom/flyersoft/components/CSS$Style;)Z
    .locals 2

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 1367
    :cond_0
    invoke-static {p0}, Lcom/flyersoft/components/CSS;->hasBorder(Lcom/flyersoft/components/CSS$Style;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object p0, p0, Lcom/flyersoft/components/CSS$Style;->backgroundColor:Ljava/lang/String;

    .line 1368
    invoke-static {p0}, Lcom/flyersoft/tools/T;->getHtmlColor(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p0

    if-eqz p0, :cond_1

    goto :goto_0

    :cond_1
    return v0

    :cond_2
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public static hasParagraphProperty(Lcom/flyersoft/components/CSS$Style;)Z
    .locals 2

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 1254
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->backgroundImage:Ljava/lang/String;

    if-nez v1, :cond_3

    .line 1255
    invoke-static {p0}, Lcom/flyersoft/components/CSS;->hasBorderOrBackgroundColor(Lcom/flyersoft/components/CSS$Style;)Z

    move-result v1

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    .line 1256
    invoke-static {v1}, Lcom/flyersoft/components/CSS;->isMarginNull(Landroid/graphics/RectF;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    .line 1257
    invoke-static {v1}, Lcom/flyersoft/components/CSS;->isMarginNull(Landroid/graphics/RectF;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->indent:Ljava/lang/Float;

    if-eqz v1, :cond_1

    sget-boolean v1, Lcom/flyersoft/tools/A;->indentParagraph:Z

    if-eqz v1, :cond_3

    :cond_1
    iget-boolean p0, p0, Lcom/flyersoft/components/CSS$Style;->noindent:Z

    if-eqz p0, :cond_2

    goto :goto_0

    :cond_2
    return v0

    :cond_3
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public static isFontWeightBold(Ljava/lang/String;)Z
    .locals 3

    .line 1119
    invoke-static {p0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 1121
    :cond_0
    const-string v0, "bold"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    return v2

    .line 1123
    :cond_1
    const-string v0, "normal"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    return v1

    .line 1125
    :cond_2
    const-string v0, "lighter"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    return v1

    .line 1127
    :cond_3
    invoke-static {p0}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result p0

    const/16 v0, 0x258

    if-lt p0, v0, :cond_4

    return v2

    :cond_4
    return v1
.end method

.method public static isFontWeightLight(Ljava/lang/String;)Z
    .locals 3

    .line 1134
    invoke-static {p0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 1136
    :cond_0
    const-string v0, "bold"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    return v1

    .line 1138
    :cond_1
    const-string v0, "normal"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    return v2

    .line 1140
    :cond_2
    const-string v0, "lighter"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    return v2

    .line 1142
    :cond_3
    invoke-static {p0}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result p0

    const/16 v0, 0x258

    if-ge p0, v0, :cond_4

    return v2

    :cond_4
    return v1
.end method

.method public static isHeaderTag(Ljava/lang/String;)Z
    .locals 4

    .line 1372
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    .line 1373
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x68

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    .line 1374
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v3, 0x31

    if-lt v1, v3, :cond_0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result p0

    const/16 v1, 0x36

    if-gt p0, v1, :cond_0

    return v0

    :cond_0
    return v2
.end method

.method public static isInheritedSize(Ljava/lang/String;)Z
    .locals 1

    .line 1114
    const-string v0, "%"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "smaller"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "larger"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "em"

    .line 1115
    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "rem"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

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

.method public static isMarginNull(Landroid/graphics/RectF;)Z
    .locals 3

    const/4 v0, 0x1

    if-nez p0, :cond_0

    return v0

    .line 1242
    :cond_0
    iget v1, p0, Landroid/graphics/RectF;->left:F

    const v2, -0x3b864000    # -999.0f

    cmpl-float v1, v1, v2

    if-nez v1, :cond_1

    iget v1, p0, Landroid/graphics/RectF;->top:F

    cmpl-float v1, v1, v2

    if-nez v1, :cond_1

    iget v1, p0, Landroid/graphics/RectF;->right:F

    cmpl-float v1, v1, v2

    if-nez v1, :cond_1

    iget p0, p0, Landroid/graphics/RectF;->bottom:F

    cmpl-float p0, p0, v2

    if-nez p0, :cond_1

    return v0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public static isSplitChar(CZ)Z
    .locals 0

    if-eqz p1, :cond_0

    const/16 p1, 0x20

    if-eq p0, p1, :cond_2

    :cond_0
    const/16 p1, 0x3b

    if-eq p0, p1, :cond_2

    const/16 p1, 0x3a

    if-eq p0, p1, :cond_2

    const/16 p1, 0xa

    if-eq p0, p1, :cond_2

    const/16 p1, 0xd

    if-eq p0, p1, :cond_2

    const/16 p1, 0x3d

    if-eq p0, p1, :cond_2

    const/16 p1, 0x22

    if-eq p0, p1, :cond_2

    const/16 p1, 0x2c

    if-eq p0, p1, :cond_2

    const/16 p1, 0x9

    if-eq p0, p1, :cond_2

    const/16 p1, 0x7b

    if-eq p0, p1, :cond_2

    const/16 p1, 0x7d

    if-ne p0, p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return p0

    :cond_2
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public static nextNotSplit(Ljava/lang/String;I)I
    .locals 2

    .line 1213
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    if-ge p1, v0, :cond_0

    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0, v1}, Lcom/flyersoft/components/CSS;->isSplitChar(CZ)Z

    move-result v0

    if-eqz v0, :cond_0

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    return p1
.end method

.method public static nextSplit(Ljava/lang/String;IZ)I
    .locals 2

    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 1220
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-ge p1, v0, :cond_2

    .line 1221
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x28

    if-ne v0, v1, :cond_1

    .line 1222
    const-string v0, ")"

    invoke-virtual {p0, v0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    add-int/lit8 p1, v0, 0x1

    goto :goto_0

    .line 1228
    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0, p2}, Lcom/flyersoft/components/CSS;->isSplitChar(CZ)Z

    move-result v0

    if-eqz v0, :cond_0

    :cond_2
    return p1
.end method

.method public static priorNotSplit(Ljava/lang/String;IZ)I
    .locals 1

    :goto_0
    add-int/lit8 p1, p1, -0x1

    if-lez p1, :cond_0

    .line 1200
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0, p2}, Lcom/flyersoft/components/CSS;->isSplitChar(CZ)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    return p1
.end method

.method public static priorSplit(Ljava/lang/String;IZ)I
    .locals 1

    :goto_0
    add-int/lit8 p1, p1, -0x1

    if-lez p1, :cond_0

    .line 1207
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0, p2}, Lcom/flyersoft/components/CSS;->isSplitChar(CZ)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    return p1
.end method

.method public static propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1

    const/4 v0, 0x0

    .line 1171
    invoke-static {p0, p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;Z)I

    move-result p0

    return p0
.end method

.method public static propertyTagIndex(Ljava/lang/String;Ljava/lang/String;Z)I
    .locals 0

    const/4 p2, 0x0

    .line 1175
    invoke-static {p0, p1, p2, p2}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;ZZ)I

    move-result p0

    return p0
.end method

.method public static propertyTagIndex(Ljava/lang/String;Ljava/lang/String;ZZ)I
    .locals 7

    const/4 v0, -0x1

    if-nez p0, :cond_0

    return v0

    :cond_0
    if-eqz p3, :cond_1

    .line 1181
    invoke-virtual {p0, p1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    goto :goto_0

    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    :goto_0
    if-eq v1, v0, :cond_b

    .line 1182
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v3, v1

    if-lt v2, v3, :cond_b

    const/4 v2, 0x0

    if-lez v1, :cond_2

    add-int/lit8 v3, v1, -0x1

    .line 1183
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    goto :goto_1

    :cond_2
    const/4 v3, 0x0

    :goto_1
    const/4 v4, 0x1

    if-eqz v1, :cond_4

    .line 1184
    invoke-static {v3, v4}, Lcom/flyersoft/components/CSS;->isSplitChar(CZ)Z

    move-result v3

    if-eqz v3, :cond_3

    goto :goto_2

    :cond_3
    const/4 v3, 0x0

    goto :goto_3

    :cond_4
    :goto_2
    const/4 v3, 0x1

    .line 1185
    :goto_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v6, v1

    if-ne v5, v6, :cond_5

    const/4 v2, 0x1

    :cond_5
    if-nez v2, :cond_6

    .line 1187
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, v1

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 1188
    invoke-static {v2, v4}, Lcom/flyersoft/components/CSS;->isSplitChar(CZ)Z

    move-result v2

    :cond_6
    if-eqz v3, :cond_7

    if-nez v2, :cond_8

    :cond_7
    if-eqz p2, :cond_9

    if-nez v3, :cond_8

    if-eqz v2, :cond_9

    :cond_8
    return v1

    .line 1193
    :cond_9
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz p3, :cond_a

    sub-int/2addr v1, v2

    invoke-virtual {p0, p1, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v1

    goto :goto_0

    :cond_a
    add-int/2addr v1, v2

    invoke-virtual {p0, p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    goto :goto_0

    :cond_b
    return v0
.end method

.method public static propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;
    .locals 1

    .line 1165
    invoke-static {p0, p1}, Lcom/flyersoft/components/CSS;->nextNotSplit(Ljava/lang/String;I)I

    move-result p1

    .line 1166
    invoke-static {p0, p1, p2}, Lcom/flyersoft/components/CSS;->nextSplit(Ljava/lang/String;IZ)I

    move-result p2

    .line 1167
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-gt p2, v0, :cond_0

    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const-string p0, ""

    return-object p0
.end method

.method public static propertyTagValue(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 2

    .line 1154
    invoke-static {p0, p1}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 1156
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    add-int/2addr v0, p1

    add-int/lit8 v0, v0, 0x1

    invoke-static {p0, v0, p2}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private trimClassName(Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    const/4 v0, 0x0

    .line 194
    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->nextNotSplit(Ljava/lang/String;I)I

    move-result v1

    .line 195
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x1

    invoke-static {p1, v2, v3}, Lcom/flyersoft/components/CSS;->priorNotSplit(Ljava/lang/String;IZ)I

    move-result v2

    add-int/2addr v2, v3

    .line 196
    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 197
    const-string v1, "["

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_2

    .line 199
    const-string v4, "]"

    invoke-virtual {p1, v4, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v4

    if-eq v4, v2, :cond_2

    .line 201
    invoke-virtual {p1, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    const-string v5, "rtl"

    invoke-virtual {v2, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 202
    const-string p1, ""

    return-object p1

    .line 203
    :cond_0
    const-string v2, "html"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "body"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 204
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/2addr v4, v3

    invoke-virtual {p1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 211
    :cond_2
    const-string v1, ">"

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/16 v2, 0x20

    if-lez v1, :cond_4

    .line 213
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v4, v3

    const-string v3, " "

    if-ge v1, v4, :cond_3

    add-int/lit8 v4, v1, 0x1

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-eq v5, v2, :cond_3

    .line 214
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_3
    add-int/lit8 v4, v1, -0x1

    .line 215
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-eq v4, v2, :cond_4

    .line 216
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_4
    const/16 v0, 0xa

    .line 219
    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public static urlNoUnderline(Ljava/lang/String;)Z
    .locals 4

    .line 157
    invoke-static {p0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 159
    :cond_0
    const-string v0, "text-decoration"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    .line 160
    const-string v3, "none"

    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result p0

    if-eq p0, v2, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    return v1
.end method


# virtual methods
.method public scanTextForStyles(Ljava/lang/String;)V
    .locals 8

    .line 60
    invoke-direct {p0, p1}, Lcom/flyersoft/components/CSS;->deleteComments(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 61
    const-string v0, " !important"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "!important"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 65
    :goto_0
    const-string v2, "{"

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    const/4 v3, -0x1

    if-ne v1, v3, :cond_0

    goto/16 :goto_6

    .line 67
    :cond_0
    const-string v4, "}"

    invoke-virtual {p1, v4, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v4

    if-ne v4, v3, :cond_1

    goto/16 :goto_6

    :cond_1
    :goto_1
    add-int/lit8 v5, v1, 0x1

    .line 72
    invoke-virtual {p1, v2, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v5

    if-eq v5, v3, :cond_3

    if-le v5, v4, :cond_2

    goto :goto_2

    :cond_2
    move v1, v5

    goto :goto_1

    .line 87
    :cond_3
    :goto_2
    :try_start_0
    invoke-direct {p0, p1, v1}, Lcom/flyersoft/components/CSS;->getClassName(Ljava/lang/String;I)Ljava/util/ArrayList;

    move-result-object v2

    .line 88
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-nez v3, :cond_4

    goto :goto_5

    :cond_4
    add-int/lit8 v3, v4, 0x1

    .line 89
    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 91
    new-instance v3, Lcom/flyersoft/components/CSS$Style;

    invoke-direct {v3}, Lcom/flyersoft/components/CSS$Style;-><init>()V

    .line 92
    invoke-virtual {v3, v1}, Lcom/flyersoft/components/CSS$Style;->scanPropertyForStyle(Ljava/lang/String;)V

    .line 93
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/util/ArrayList;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "\n"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v3, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v3, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    const/4 v1, 0x0

    .line 94
    :goto_3
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v1, v5, :cond_6

    .line 95
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 96
    iget-object v6, p0, Lcom/flyersoft/components/CSS;->styles:Ljava/util/HashMap;

    invoke-virtual {v6, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    iget-object v6, p0, Lcom/flyersoft/components/CSS;->styles:Ljava/util/HashMap;

    invoke-virtual {v6, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/flyersoft/components/CSS$Style;

    goto :goto_4

    :cond_5
    new-instance v6, Lcom/flyersoft/components/CSS$Style;

    invoke-direct {v6}, Lcom/flyersoft/components/CSS$Style;-><init>()V

    .line 97
    :goto_4
    invoke-virtual {v6, v3}, Lcom/flyersoft/components/CSS$Style;->combineStyle(Lcom/flyersoft/components/CSS$Style;)V

    .line 98
    iput-object v5, v6, Lcom/flyersoft/components/CSS$Style;->name:Ljava/lang/String;

    .line 99
    iget-object v7, p0, Lcom/flyersoft/components/CSS;->styles:Ljava/util/HashMap;

    invoke-virtual {v7, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_6
    :goto_5
    move v1, v4

    goto/16 :goto_0

    :catch_0
    move-exception p1

    .line 102
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_6
    return-void
.end method
