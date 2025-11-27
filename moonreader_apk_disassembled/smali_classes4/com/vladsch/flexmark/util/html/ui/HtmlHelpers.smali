.class public Lcom/vladsch/flexmark/util/html/ui/HtmlHelpers;
.super Ljava/lang/Object;
.source "HtmlHelpers.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static mixedColor(Ljava/awt/Color;Ljava/awt/Color;)Ljava/awt/Color;
    .locals 10

    .line 81
    invoke-virtual {p0}, Ljava/awt/Color;->getRed()I

    move-result v0

    invoke-virtual {p0}, Ljava/awt/Color;->getGreen()I

    move-result v1

    invoke-virtual {p0}, Ljava/awt/Color;->getBlue()I

    move-result p0

    const/4 v2, 0x3

    new-array v3, v2, [F

    invoke-static {v0, v1, p0, v3}, Ljava/awt/Color;->RGBtoHSB(III[F)[F

    move-result-object p0

    .line 82
    invoke-virtual {p1}, Ljava/awt/Color;->getRed()I

    move-result v0

    invoke-virtual {p1}, Ljava/awt/Color;->getGreen()I

    move-result v1

    invoke-virtual {p1}, Ljava/awt/Color;->getBlue()I

    move-result p1

    new-array v3, v2, [F

    invoke-static {v0, v1, p1, v3}, Ljava/awt/Color;->RGBtoHSB(III[F)[F

    move-result-object p1

    const/4 v0, 0x0

    .line 97
    aget v1, p1, v0

    const/4 v3, 0x1

    .line 98
    aget v4, p0, v3

    aget v5, p1, v3

    new-array v6, v3, [F

    const v7, 0x3e99999a    # 0.3f

    aput v7, v6, v0

    invoke-static {v5, v6}, Lcom/vladsch/flexmark/util/Utils;->max(F[F)F

    move-result v5

    new-array v6, v3, [F

    const/high16 v8, 0x3f000000    # 0.5f

    aput v8, v6, v0

    invoke-static {v5, v6}, Lcom/vladsch/flexmark/util/Utils;->min(F[F)F

    move-result v5

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-static {v4, v5, v6}, Lcom/vladsch/flexmark/util/Utils;->rangeLimit(FFF)F

    move-result v4

    const/4 v5, 0x2

    .line 99
    aget p0, p0, v5

    aget p1, p1, v5

    new-array v9, v3, [F

    aput v7, v9, v0

    invoke-static {p1, v9}, Lcom/vladsch/flexmark/util/Utils;->max(F[F)F

    move-result p1

    new-array v7, v3, [F

    aput v8, v7, v0

    invoke-static {p1, v7}, Lcom/vladsch/flexmark/util/Utils;->min(F[F)F

    move-result p1

    invoke-static {p0, p1, v6}, Lcom/vladsch/flexmark/util/Utils;->rangeLimit(FFF)F

    move-result p0

    new-array p1, v2, [F

    aput v1, p1, v0

    aput v4, p1, v3

    aput p0, p1, v5

    .line 100
    aget p0, p1, v0

    aget v0, p1, v3

    aget p1, p1, v5

    invoke-static {p0, v0, p1}, Ljava/awt/Color;->getHSBColor(FFF)Ljava/awt/Color;

    move-result-object p0

    return-object p0
.end method

.method public static setRegExError(Ljava/lang/String;Ljavax/swing/JTextPane;Ljava/awt/Font;Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;)V
    .locals 5

    .line 48
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;-><init>()V

    .line 49
    const-string v1, "html"

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    const-string v3, "margin:2px;vertical-align:middle;"

    invoke-virtual {v2, v3}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->style(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p3, v3, v4

    const/4 p3, 0x1

    aput-object p2, v3, p3

    invoke-virtual {v2, v3}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->attr([Ljava/lang/Object;)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    move-result-object p2

    const-string v2, "body"

    invoke-virtual {p2, v2}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 50
    new-array p2, p3, [Ljava/lang/Object;

    aput-object p4, p2, v4

    invoke-virtual {v0, p2}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->attr([Ljava/lang/Object;)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    move-result-object p2

    const-string p4, "div"

    invoke-virtual {p2, p4}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 51
    invoke-static {p0, p3}, Lcom/vladsch/flexmark/util/html/ui/HtmlHelpers;->toHtmlError(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->append(Ljava/lang/String;)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    .line 52
    invoke-virtual {v0, p4}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->closeTag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 53
    invoke-virtual {v0, v2}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->closeTag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 54
    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->closeTag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 56
    invoke-virtual {p1, p3}, Ljavax/swing/JTextPane;->setVisible(Z)V

    .line 57
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->toFinalizedString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljavax/swing/JTextPane;->setText(Ljava/lang/String;)V

    .line 58
    invoke-virtual {p1}, Ljavax/swing/JTextPane;->revalidate()V

    .line 59
    invoke-virtual {p1}, Ljavax/swing/JTextPane;->getParent()Ljava/awt/Container;

    move-result-object p0

    invoke-virtual {p0}, Ljava/awt/Container;->revalidate()V

    .line 60
    invoke-virtual {p1}, Ljavax/swing/JTextPane;->getParent()Ljava/awt/Container;

    move-result-object p0

    invoke-virtual {p0}, Ljava/awt/Container;->getParent()Ljava/awt/Container;

    move-result-object p0

    invoke-virtual {p0}, Ljava/awt/Container;->revalidate()V

    return-void
.end method

.method public static toHtmlError(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 7

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    if-eqz p1, :cond_2

    .line 34
    const-string p1, "(?:^|\n)(.*\n)(\\s*)\\^(\n?)$"

    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    .line 35
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x2

    .line 36
    invoke-virtual {p1, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 37
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    const/4 v2, 0x1

    .line 38
    invoke-virtual {p1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1

    invoke-virtual {p1, v2}, Ljava/util/regex/Matcher;->start(I)I

    move-result v2

    goto :goto_0

    :cond_1
    invoke-virtual {p1, v0}, Ljava/util/regex/Matcher;->start(I)I

    move-result v2

    .line 39
    :goto_0
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    const-string v4, "&nbsp;"

    invoke-static {v4, v3}, Lcom/vladsch/flexmark/util/Utils;->repeat(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    .line 40
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v6, 0x0

    invoke-virtual {p0, v6, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "<span style=\"font-family:monospaced\">"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/util/regex/Matcher;->start(I)I

    move-result p1

    invoke-virtual {p0, v2, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    const-string p1, " "

    invoke-virtual {p0, p1, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "^</span>"

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 44
    :cond_2
    const-string p1, "\n"

    const-string v0, "<br>"

    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static toHtmlString(Ljava/awt/Color;)Ljava/lang/String;
    .locals 4

    if-nez p0, :cond_0

    .line 77
    const-string p0, "#000000"

    return-object p0

    :cond_0
    invoke-virtual {p0}, Ljava/awt/Color;->getRed()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0}, Ljava/awt/Color;->getGreen()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0}, Ljava/awt/Color;->getBlue()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    const/4 v0, 0x2

    aput-object p0, v2, v0

    const-string p0, "#%02x%02x%02x"

    invoke-static {p0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static toRgbString(Ljava/awt/Color;)Ljava/lang/String;
    .locals 3

    if-nez p0, :cond_0

    .line 73
    const-string p0, "rgb(0,0,0)"

    return-object p0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "rgb("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/awt/Color;->getRed()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/awt/Color;->getGreen()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/awt/Color;->getBlue()I

    move-result p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static withContext(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 64
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p0, 0xa

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 66
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 p0, 0x1

    .line 67
    :goto_0
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p1

    if-ge p0, p1, :cond_0

    const/16 p1, 0x20

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 p0, p0, 0x1

    goto :goto_0

    .line 68
    :cond_0
    const-string p0, "^\n"

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
