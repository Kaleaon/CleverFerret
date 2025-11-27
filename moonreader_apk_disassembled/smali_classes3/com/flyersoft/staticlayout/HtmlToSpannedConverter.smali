.class Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;
.super Ljava/lang/Object;
.source "MyHtml.java"

# interfaces
.implements Lorg/xml/sax/ContentHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Monospace;,
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FontQuote;,
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$PreQuote;,
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Alignment;,
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$BlockQuote;,
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableQuote;,
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$ULQuote;,
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$MyBullet;,
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Italic;,
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Bold;,
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Big;,
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Small;,
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Underline;,
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Strikethrough;,
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Super;,
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Sub;,
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Header;,
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$RubyTag;,
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Hide;,
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$MarginQuote;,
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$BackgroundColor;,
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Light;,
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Sup;,
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Shadow;,
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Font;,
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TextFillColor;,
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Emphasis_Tag;,
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FloatQuote;,
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Strong;,
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Href;,
        Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;
    }
.end annotation


# static fields
.field private static final HEADER_SIZES:[F


# instance fields
.field LI_statement:Z

.field UL_statement:Z

.field alignTag:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/CSS$Style;",
            ">;"
        }
    .end annotation
.end field

.field backgroundColorTag:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/CSS$Style;",
            ">;"
        }
    .end annotation
.end field

.field backgroundColorValue:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field boldTag:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/CSS$Style;",
            ">;"
        }
    .end annotation
.end field

.field private chapterId:I

.field classes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field code_start:I

.field cssStyles:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/CSS$Style;",
            ">;"
        }
    .end annotation
.end field

.field deletedFloatContent:Ljava/lang/CharSequence;

.field displayNoneTag:Ljava/lang/String;

.field emphasisTag:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/CSS$Style;",
            ">;"
        }
    .end annotation
.end field

.field floatSpanType:I

.field floatTag:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/CSS$Style;",
            ">;"
        }
    .end annotation
.end field

.field fontSizeTag:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/CSS$Style;",
            ">;"
        }
    .end annotation
.end field

.field fontTag:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/CSS$Style;",
            ">;"
        }
    .end annotation
.end field

.field hasBackgroundColor:Z

.field private hasBr:Z

.field hideTag:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/CSS$Style;",
            ">;"
        }
    .end annotation
.end field

.field ignoreFamilyFace:Z

.field ignoreStart:Z

.field italicTag:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/CSS$Style;",
            ">;"
        }
    .end annotation
.end field

.field private lastEndTag:Ljava/lang/String;

.field li_tag:Ljava/lang/String;

.field lightTag:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/CSS$Style;",
            ">;"
        }
    .end annotation
.end field

.field private mMyImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

.field private mReader:Lorg/xml/sax/XMLReader;

.field private mSource:Ljava/lang/String;

.field private mTagHandler:Lcom/flyersoft/staticlayout/MyHtml$TagHandler;

.field marginTag:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/CSS$Style;",
            ">;"
        }
    .end annotation
.end field

.field mediaTag:Ljava/lang/String;

.field mediaTagStart:I

.field ol_value:I

.field preTagStart:Z

.field rubyRbStart:Z

.field rubyRtStart:Z

.field rubyRtText:Ljava/lang/String;

.field rubyStart:Z

.field savedCssForNextChar:Lcom/flyersoft/components/CSS$Style;

.field savedImgAttributesForNextChar:Lorg/xml/sax/Attributes;

.field savedImgStartPos:I

.field shadowTag:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/CSS$Style;",
            ">;"
        }
    .end annotation
.end field

.field private spanBulder:Landroid/text/SpannableStringBuilder;

.field strikethroughTag:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/CSS$Style;",
            ">;"
        }
    .end annotation
.end field

.field tableHtmls:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field tableIndexInHtml:I

.field tableLevel:I

.field tableList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;",
            ">;"
        }
    .end annotation
.end field

.field tableSp:Lcom/flyersoft/staticlayout/MyTableSpan;

.field tableStart:I

.field tags:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private td_start:I

.field textFillColorTag:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/CSS$Style;",
            ">;"
        }
    .end annotation
.end field

.field ul_level:I

.field underlineTag:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/CSS$Style;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static bridge synthetic -$$Nest$sfgetHEADER_SIZES()[F
    .locals 1

    sget-object v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->HEADER_SIZES:[F

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x6

    .line 3252
    new-array v0, v0, [F

    fill-array-data v0, :array_0

    sput-object v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->HEADER_SIZES:[F

    return-void

    nop

    :array_0
    .array-data 4
        0x40000000    # 2.0f
        0x3fc00000    # 1.5f
        0x3f95c28f    # 1.17f
        0x3f800000    # 1.0f
        0x3f547ae1    # 0.83f
        0x3f400000    # 0.75f
    .end array-data
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;Lcom/flyersoft/staticlayout/MyHtml$TagHandler;Lorg/ccil/cowan/tagsoup/Parser;I)V
    .locals 2

    .line 545
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 658
    iput v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->mediaTagStart:I

    .line 1172
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tags:Ljava/util/ArrayList;

    .line 1173
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->classes:Ljava/util/ArrayList;

    .line 1174
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->cssStyles:Ljava/util/ArrayList;

    .line 1376
    iput-boolean v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->ignoreFamilyFace:Z

    .line 1811
    iput v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->floatSpanType:I

    const/4 v1, -0x1

    .line 2811
    iput v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableStart:I

    iput v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableLevel:I

    iput v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableIndexInHtml:I

    .line 546
    iput-boolean v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->hasBr:Z

    .line 547
    iput-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->mSource:Ljava/lang/String;

    .line 548
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->initCssTagList()V

    .line 549
    new-instance p1, Landroid/text/SpannableStringBuilder;

    invoke-direct {p1}, Landroid/text/SpannableStringBuilder;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->spanBulder:Landroid/text/SpannableStringBuilder;

    .line 550
    iput-object p2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->mMyImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    .line 551
    iput-object p3, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->mTagHandler:Lcom/flyersoft/staticlayout/MyHtml$TagHandler;

    .line 552
    iput-object p4, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->mReader:Lorg/xml/sax/XMLReader;

    .line 553
    iput p5, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->chapterId:I

    return-void
.end method

.method private addEpub3PrintEditionNumbers(Ljava/lang/String;Landroid/text/SpannableStringBuilder;)V
    .locals 4

    .line 2715
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-eqz v0, :cond_0

    .line 2716
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    iget-object v1, v1, Lcom/flyersoft/books/BaseEBook;->pages:Ljava/util/ArrayList;

    invoke-static {p1, v1}, Lcom/flyersoft/books/Epub;->getPageListTitle(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 2717
    :cond_0
    invoke-virtual {p2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 2718
    invoke-direct {p0, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBrDouble(Landroid/text/SpannableStringBuilder;)V

    .line 2719
    invoke-direct {p0, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBrDouble(Landroid/text/SpannableStringBuilder;)V

    .line 2721
    :cond_1
    invoke-virtual {p2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    .line 2722
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v1, v0

    .line 2723
    invoke-virtual {p2, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 2724
    new-instance p1, Lcom/flyersoft/staticlayout/MyStyleSpan;

    const/4 v2, 0x1

    invoke-direct {p1, v2}, Lcom/flyersoft/staticlayout/MyStyleSpan;-><init>(I)V

    invoke-direct {p0, p2, p1, v0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 2726
    new-instance p1, Landroid/text/style/ForegroundColorSpan;

    const v3, -0x777778

    invoke-direct {p1, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-direct {p0, p2, p1, v0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 2727
    sget-boolean p1, Lcom/flyersoft/tools/A;->indentParagraph:Z

    if-eqz p1, :cond_2

    .line 2728
    new-instance p1, Lcom/flyersoft/staticlayout/MyMarginSpan;

    const/4 v3, 0x0

    invoke-direct {p1, v3, v3, v3, v3}, Lcom/flyersoft/staticlayout/MyMarginSpan;-><init>(FFFF)V

    .line 2729
    iput-boolean v2, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->noindent:Z

    .line 2730
    invoke-direct {p0, p2, p1, v0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 2733
    :cond_2
    new-instance p1, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;

    const v3, 0x3f666666    # 0.9f

    invoke-direct {p1, v3}, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;-><init>(F)V

    const/4 v3, 0x0

    .line 2734
    iput-boolean v3, p1, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;->inherited:Z

    .line 2735
    invoke-direct {p0, p2, p1, v0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 2736
    new-instance p1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Alignment;

    invoke-direct {p1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Alignment;-><init>(I)V

    invoke-direct {p0, p2, p1, v0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setAlignment(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Alignment;II)V

    .line 2737
    invoke-direct {p0, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBrSingle(Landroid/text/SpannableStringBuilder;)V

    return-void
.end method

.method private addImgFloatQuote(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/components/CSS$Style;Lcom/flyersoft/staticlayout/MyImageSpan;Lorg/xml/sax/Attributes;)Z
    .locals 2

    .line 1803
    new-instance v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FloatQuote;

    const-string v1, "img"

    invoke-direct {v0, v1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FloatQuote;-><init>(Ljava/lang/String;Lcom/flyersoft/components/CSS$Style;)V

    const/4 p2, 0x1

    .line 1804
    iput-boolean p2, p3, Lcom/flyersoft/staticlayout/MyImageSpan;->originalSize:Z

    .line 1805
    iput-object p3, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FloatQuote;->imageSpan:Lcom/flyersoft/staticlayout/MyImageSpan;

    .line 1806
    iput-object p4, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FloatQuote;->attributes:Lorg/xml/sax/Attributes;

    const p3, 0xfffc

    .line 1807
    invoke-virtual {p1, p3}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 1808
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p3

    sub-int/2addr p3, p2

    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p2

    invoke-direct {p0, p1, v0, p3, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setFloatQuote(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FloatQuote;II)Z

    move-result p1

    return p1
.end method

.method private addTagCache(Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 1

    .line 1005
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tags:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1006
    iget-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->classes:Ljava/util/ArrayList;

    const-string v0, "class"

    invoke-direct {p0, p2, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getValue(Lorg/xml/sax/Attributes;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1007
    iget-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->cssStyles:Ljava/util/ArrayList;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private appendHR(Landroid/text/SpannableStringBuilder;)V
    .locals 2

    .line 1167
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_0

    add-int/lit8 v0, v0, -0x1

    .line 1168
    invoke-virtual {p1, v0}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v0

    const/16 v1, 0xa

    if-ne v0, v1, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    const-string v0, "\n"

    .line 1169
    :goto_0
    const-string v1, "\u2500\u2500\u2500\n"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->appendText(Landroid/text/SpannableStringBuilder;Ljava/lang/String;)V

    return-void
.end method

.method private appendText(Landroid/text/SpannableStringBuilder;Ljava/lang/String;)V
    .locals 5

    .line 639
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    .line 640
    const-string v1, "\n"

    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    if-lt v0, v3, :cond_0

    add-int/lit8 v2, v0, -0x1

    invoke-virtual {p1, v2}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v2

    const/16 v4, 0xa

    if-ne v2, v4, :cond_0

    .line 641
    invoke-virtual {p2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    .line 642
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
    if-lez v0, :cond_2

    .line 646
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 647
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBr(Landroid/text/SpannableStringBuilder;)V

    return-void

    .line 649
    :cond_1
    invoke-virtual {p1, p2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    return-void

    .line 651
    :cond_2
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v3, :cond_3

    .line 652
    invoke-virtual {p1, p2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    :cond_3
    :goto_0
    return-void
.end method

.method private cssUsedTag(Ljava/lang/String;)Z
    .locals 1

    .line 1067
    const-string v0, "blockquote"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "p"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "div"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "fieldset"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "code"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1068
    invoke-static {p1}, Lcom/flyersoft/components/CSS;->isHeaderTag(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "span"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "section"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-boolean v0, Lcom/flyersoft/staticlayout/MyHtml;->isFb2:Z

    if-eqz v0, :cond_0

    const-string v0, "style"

    .line 1069
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method private dealTableContent()V
    .locals 13

    .line 2853
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 2854
    :goto_0
    iget-object v8, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableList:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    const/4 v9, 0x2

    if-ge v3, v8, :cond_7

    .line 2855
    iget-object v8, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableList:Ljava/util/ArrayList;

    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;

    .line 2856
    iget v10, v8, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;->type:I

    if-ne v10, v9, :cond_1

    if-eqz v5, :cond_6

    if-eqz v6, :cond_0

    .line 2859
    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2860
    iget-object v6, v8, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;->tag:Ljava/lang/String;

    iput-object v6, v8, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;->tdText:Ljava/lang/String;

    const/4 v6, 0x0

    goto :goto_2

    .line 2863
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v9

    sub-int/2addr v9, v2

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;

    .line 2865
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, v9, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;->tdText:Ljava/lang/String;

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v9, v8, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;->tag:Ljava/lang/String;

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    iput-object v9, v8, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;->tdText:Ljava/lang/String;

    .line 2866
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v9

    sub-int/2addr v9, v2

    invoke-virtual {v0, v9, v8}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 2869
    :cond_1
    iget-object v9, v8, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;->tag:Ljava/lang/String;

    const-string v10, "tr"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 2872
    iget v5, v8, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;->type:I

    if-nez v5, :cond_2

    const/4 v4, 0x0

    :cond_2
    const/4 v5, 0x0

    const/4 v7, 0x1

    goto :goto_2

    .line 2874
    :cond_3
    iget-object v9, v8, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;->tag:Ljava/lang/String;

    const-string v10, "td"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6

    if-eqz v7, :cond_4

    const/4 v5, 0x0

    goto :goto_1

    :cond_4
    move v5, v7

    .line 2880
    :goto_1
    iget v6, v8, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;->type:I

    if-nez v6, :cond_5

    add-int/lit8 v4, v4, 0x1

    :cond_5
    move v6, v7

    move v7, v5

    move v5, v6

    :cond_6
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 2885
    :cond_7
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-le v3, v2, :cond_15

    if-le v4, v2, :cond_15

    .line 2886
    iget-object v3, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->spanBulder:Landroid/text/SpannableStringBuilder;

    iget v5, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableStart:I

    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v6

    invoke-virtual {v3, v5, v6}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    .line 2888
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 2890
    invoke-static {}, Lcom/flyersoft/tools/A;->getPageWidth()I

    move-result v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    .line 2891
    :goto_3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-ge v7, v10, :cond_b

    .line 2892
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;

    iget-object v10, v10, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;->tdText:Ljava/lang/String;

    .line 2893
    const-string v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_8

    .line 2894
    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    invoke-virtual {v3, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 2896
    :cond_8
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;

    iget-object v11, v11, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;->tag:Ljava/lang/String;

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    const/16 v12, 0x32

    if-le v11, v12, :cond_9

    div-int/lit8 v10, v5, 0x2

    int-to-float v10, v10

    goto :goto_4

    :cond_9
    sget-object v11, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v11}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v10

    .line 2897
    :goto_4
    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    invoke-virtual {v3, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    cmpl-float v11, v10, v8

    if-lez v11, :cond_a

    move v8, v10

    :cond_a
    :goto_5
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    :cond_b
    const/4 v7, 0x3

    if-ge v4, v7, :cond_c

    .line 2903
    div-int/2addr v5, v9

    goto :goto_6

    :cond_c
    mul-int/lit8 v5, v5, 0x2

    div-int/lit8 v5, v5, 0x5

    :goto_6
    int-to-float v4, v5

    cmpl-float v5, v8, v4

    if-lez v5, :cond_d

    move v8, v4

    :cond_d
    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 2907
    :goto_7
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v4, v7, :cond_f

    .line 2908
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    const/high16 v9, 0x40800000    # 4.0f

    div-float v9, v8, v9

    cmpl-float v7, v7, v9

    if-lez v7, :cond_e

    add-int/lit8 v5, v5, 0x1

    :cond_e
    add-int/lit8 v4, v4, 0x1

    goto :goto_7

    :cond_f
    if-le v5, v2, :cond_12

    .line 2912
    sget-object v4, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v4}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v4

    const-string v5, "\u00a0"

    invoke-static {v5, v4}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v4

    .line 2913
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v7, 0x0

    .line 2914
    :goto_8
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-ge v7, v9, :cond_12

    .line 2915
    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v9

    cmpl-float v9, v9, v6

    if-lez v9, :cond_11

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v9

    cmpg-float v9, v9, v8

    if-gez v9, :cond_11

    .line 2916
    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v9

    sub-float v9, v8, v9

    div-float/2addr v9, v4

    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v9

    if-lez v9, :cond_11

    .line 2918
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    const/4 v10, 0x0

    :goto_9
    if-ge v10, v9, :cond_10

    const/16 v11, 0xa0

    .line 2920
    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v10, v10, 0x1

    goto :goto_9

    .line 2921
    :cond_10
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;

    iget-object v11, v11, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;->tag:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    iput-object v10, v9, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;->tag:Ljava/lang/String;

    :cond_11
    add-int/lit8 v7, v7, 0x1

    goto :goto_8

    .line 2927
    :cond_12
    :goto_a
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_15

    .line 2928
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableList:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;

    .line 2929
    iget v3, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;->type:I

    if-nez v3, :cond_13

    .line 2930
    iget-object v3, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;->tag:Ljava/lang/String;

    iget-object v0, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;->attr:Lorg/xml/sax/Attributes;

    invoke-direct {p0, v3, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleStartTag(Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    goto :goto_b

    .line 2931
    :cond_13
    iget v3, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;->type:I

    if-ne v3, v2, :cond_14

    .line 2932
    iget-object v0, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;->tag:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleEndTag(Ljava/lang/String;)V

    goto :goto_b

    .line 2934
    :cond_14
    iget-object v3, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->spanBulder:Landroid/text/SpannableStringBuilder;

    iget-object v0, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;->tag:Ljava/lang/String;

    invoke-virtual {v3, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    :goto_b
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 2939
    :cond_15
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableSp:Lcom/flyersoft/staticlayout/MyTableSpan;

    iget v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableStart:I

    iput v1, v0, Lcom/flyersoft/staticlayout/MyTableSpan;->spStart:I

    .line 2940
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableSp:Lcom/flyersoft/staticlayout/MyTableSpan;

    iget-object v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->spanBulder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v1

    iput v1, v0, Lcom/flyersoft/staticlayout/MyTableSpan;->spEnd:I

    .line 2941
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableSp:Lcom/flyersoft/staticlayout/MyTableSpan;

    iget v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableIndexInHtml:I

    iput v1, v0, Lcom/flyersoft/staticlayout/MyTableSpan;->tableIndex:I

    .line 2942
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableSp:Lcom/flyersoft/staticlayout/MyTableSpan;

    iget v1, v0, Lcom/flyersoft/staticlayout/MyTableSpan;->tableIndex:I

    invoke-direct {p0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getTableHtml(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/staticlayout/MyTableSpan;->html:Ljava/lang/String;

    .line 2943
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->spanBulder:Landroid/text/SpannableStringBuilder;

    iget-object v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableSp:Lcom/flyersoft/staticlayout/MyTableSpan;

    iget v2, v1, Lcom/flyersoft/staticlayout/MyTableSpan;->spStart:I

    iget-object v3, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableSp:Lcom/flyersoft/staticlayout/MyTableSpan;

    iget v3, v3, Lcom/flyersoft/staticlayout/MyTableSpan;->spEnd:I

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    return-void
.end method

.method private deleteTopMarginIfPriorHas(Lcom/flyersoft/staticlayout/MyMarginSpan;Landroid/text/SpannableStringBuilder;I)V
    .locals 8

    .line 2137
    iget-object v0, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v0, v0, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    return-void

    .line 2142
    :cond_0
    const-string v0, "span"

    const-string v2, "div"

    const/4 v3, 0x2

    const v4, -0x3b864000    # -999.0f

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-le p3, v3, :cond_1

    add-int/lit8 v3, p3, -0x1

    invoke-virtual {p2, v3}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v3

    const/16 v7, 0xa

    if-ne v3, v7, :cond_1

    add-int/lit8 v3, p3, -0x2

    invoke-virtual {p2, v3}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v3

    if-ne v3, v7, :cond_1

    goto :goto_1

    .line 2144
    :cond_1
    const-class v3, Lcom/flyersoft/staticlayout/MyMarginSpan;

    invoke-virtual {p2, v5, p3, v3}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lcom/flyersoft/staticlayout/MyMarginSpan;

    .line 2145
    array-length v7, v3

    if-lez v7, :cond_3

    .line 2146
    array-length v7, v3

    sub-int/2addr v7, v6

    aget-object v3, v3, v7

    if-eqz v3, :cond_3

    .line 2147
    invoke-virtual {p2, v3}, Landroid/text/SpannableStringBuilder;->getSpanEnd(Ljava/lang/Object;)I

    move-result p2

    if-ne p2, p3, :cond_3

    .line 2148
    iget-object p2, v3, Lcom/flyersoft/staticlayout/MyMarginSpan;->tag:Ljava/lang/String;

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2

    iget-object p2, v3, Lcom/flyersoft/staticlayout/MyMarginSpan;->tag:Ljava/lang/String;

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2

    const/4 p2, 0x1

    goto :goto_0

    :cond_2
    const/4 p2, 0x0

    .line 2149
    :goto_0
    iget-object p3, v3, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    if-eqz p3, :cond_4

    iget-object p3, v3, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object p3, p3, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    if-eqz p3, :cond_4

    .line 2150
    iget-object p3, v3, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object p3, p3, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    iget p3, p3, Landroid/graphics/RectF;->bottom:F

    goto :goto_2

    :cond_3
    :goto_1
    const/4 p2, 0x0

    :cond_4
    const p3, -0x3b864000    # -999.0f

    .line 2156
    :goto_2
    iget-object v3, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->tag:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    iget-object v2, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->tag:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    const/4 v5, 0x1

    :cond_5
    const/high16 v0, 0x3f800000    # 1.0f

    if-nez v5, :cond_6

    :goto_3
    const/4 p2, 0x0

    goto :goto_4

    :cond_6
    cmpl-float v2, p3, v4

    if-nez v2, :cond_8

    if-eqz p2, :cond_7

    goto :goto_3

    :cond_7
    const/high16 p2, 0x3f800000    # 1.0f

    goto :goto_4

    :cond_8
    cmpl-float p2, p3, v0

    if-ltz p2, :cond_9

    goto :goto_3

    :cond_9
    cmpl-float p2, p3, v1

    if-lez p2, :cond_a

    sub-float p2, v0, p3

    goto :goto_4

    :cond_a
    add-float p2, p3, v0

    .line 2161
    :goto_4
    iget-object v2, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    if-nez v2, :cond_b

    .line 2162
    invoke-static {}, Lcom/flyersoft/tools/A;->getParagraphRatio()F

    move-result p3

    mul-float p2, p2, p3

    iput p2, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->topMargin:F

    return-void

    .line 2164
    :cond_b
    iget-object v2, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v2, v2, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    cmpl-float v3, v2, v1

    if-eqz v3, :cond_f

    cmpl-float v3, v2, v4

    if-eqz v3, :cond_f

    if-eqz v5, :cond_e

    const v3, 0x3dcccccd    # 0.1f

    cmpg-float p3, p3, v3

    if-gez p3, :cond_c

    move p2, v2

    goto :goto_6

    :cond_c
    cmpl-float p3, v2, v0

    if-ltz p3, :cond_d

    sub-float/2addr v2, v0

    goto :goto_5

    :cond_d
    cmpg-float p3, v2, v1

    if-gez p3, :cond_f

    :cond_e
    :goto_5
    add-float/2addr p2, v2

    .line 2176
    :cond_f
    :goto_6
    iget-object p3, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object p3, p3, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    invoke-static {p3, v6}, Lcom/flyersoft/components/CSS;->getPadding(Landroid/graphics/RectF;I)F

    move-result p3

    add-float/2addr p3, p2

    iget-object v0, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v0, v0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    iget-object v1, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    .line 2177
    invoke-static {v0, v1, v6}, Lcom/flyersoft/components/CSS;->getBorder([Ljava/lang/String;Landroid/graphics/RectF;I)F

    move-result v0

    add-float/2addr p3, v0

    invoke-static {}, Lcom/flyersoft/tools/A;->getParagraphRatio()F

    move-result v0

    mul-float p3, p3, v0

    iput p3, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->topMargin:F

    .line 2178
    new-instance p3, Lcom/flyersoft/components/CSS$Style;

    iget-object v0, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    invoke-direct {p3, v0}, Lcom/flyersoft/components/CSS$Style;-><init>(Lcom/flyersoft/components/CSS$Style;)V

    iput-object p3, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    .line 2179
    iget-object p1, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object p1, p1, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    iput p2, p1, Landroid/graphics/RectF;->top:F

    return-void
.end method

.method private displayNone(Lcom/flyersoft/components/CSS$Style;)Z
    .locals 1

    if-eqz p1, :cond_0

    .line 1332
    const-string v0, "none"

    iget-object p1, p1, Lcom/flyersoft/components/CSS$Style;->display:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private displayNone(Lcom/flyersoft/components/CSS$Style;Lorg/xml/sax/Attributes;Ljava/lang/String;)Z
    .locals 0

    .line 1340
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->displayNone(Lcom/flyersoft/components/CSS$Style;)Z

    move-result p1

    if-nez p1, :cond_1

    invoke-direct {p0, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->displayNone(Lorg/xml/sax/Attributes;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    .line 1341
    :cond_1
    :goto_0
    iput-object p3, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->displayNoneTag:Ljava/lang/String;

    const/4 p1, 0x1

    return p1
.end method

.method private displayNone(Lorg/xml/sax/Attributes;)Z
    .locals 1

    if-eqz p1, :cond_0

    .line 1336
    const-string v0, "hidden"

    invoke-interface {p1, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V
    .locals 9

    .line 1583
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    .line 1584
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getLast(Landroid/text/Spanned;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    if-nez v6, :cond_0

    :goto_0
    move-object p1, p0

    goto/16 :goto_4

    .line 1589
    :cond_0
    invoke-virtual {p1, v6}, Landroid/text/SpannableStringBuilder;->getSpanStart(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    goto :goto_0

    .line 1593
    :cond_1
    invoke-virtual {p1, v6}, Landroid/text/SpannableStringBuilder;->removeSpan(Ljava/lang/Object;)V

    .line 1597
    instance-of v1, v6, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Sup;

    if-eqz v1, :cond_2

    const p2, 0x3f733333    # 0.95f

    .line 1598
    invoke-direct {p0, p1, v0, v3, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSuperScriptSpan(Landroid/text/SpannableStringBuilder;IIF)V

    return-void

    .line 1602
    :cond_2
    instance-of v1, v6, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Hide;

    if-eqz v1, :cond_3

    .line 1603
    invoke-virtual {p1, v0, v3}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    return-void

    .line 1607
    :cond_3
    instance-of v1, v6, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableQuote;

    if-eqz v1, :cond_4

    .line 1608
    check-cast v6, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableQuote;

    invoke-direct {p0, p1, v6, v0, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setTableQuote(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableQuote;II)V

    return-void

    .line 1612
    :cond_4
    instance-of v1, v6, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FloatQuote;

    if-eqz v1, :cond_5

    .line 1613
    check-cast v6, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FloatQuote;

    invoke-direct {p0, p1, v6, v0, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setFloatQuote(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FloatQuote;II)Z

    return-void

    .line 1617
    :cond_5
    instance-of v1, v6, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$ULQuote;

    if-eqz v1, :cond_6

    .line 1618
    check-cast v6, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$ULQuote;

    invoke-direct {p0, p1, v6, v0, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setULQuote(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$ULQuote;II)V

    return-void

    .line 1622
    :cond_6
    instance-of v1, v6, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FontQuote;

    if-eqz v1, :cond_7

    .line 1623
    check-cast v6, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FontQuote;

    invoke-direct {p0, p1, v6, v0, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setFontQuote(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FontQuote;II)V

    return-void

    .line 1627
    :cond_7
    instance-of v1, v6, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$PreQuote;

    if-eqz v1, :cond_8

    .line 1628
    check-cast v6, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$PreQuote;

    invoke-direct {p0, p1, v6, v0, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setPreQuote(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$PreQuote;II)V

    return-void

    .line 1634
    :cond_8
    instance-of v1, v6, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Big;

    if-eqz v1, :cond_9

    .line 1635
    new-instance p3, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;

    move-object v1, v6

    check-cast v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Big;

    iget v2, v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Big;->size:F

    invoke-direct {p3, v2}, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;-><init>(F)V

    .line 1636
    move-object v2, p3

    check-cast v2, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;

    iget-boolean v1, v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Big;->inherited:Z

    iput-boolean v1, p3, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;->inherited:Z

    .line 1639
    :cond_9
    instance-of v1, v6, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Strong;

    if-eqz v1, :cond_a

    .line 1640
    move-object v1, v6

    check-cast v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Strong;

    iget-object v2, v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Strong;->style:Lcom/flyersoft/components/CSS$Style;

    if-eqz v2, :cond_a

    iget-object v1, v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Strong;->style:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->fontWeight:Ljava/lang/String;

    if-eqz v1, :cond_a

    goto :goto_0

    .line 1644
    :cond_a
    instance-of v1, v6, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$MyBullet;

    const/16 v7, 0xa

    if-eqz v1, :cond_d

    .line 1645
    new-instance p3, Lcom/flyersoft/staticlayout/MyBulletSpan;

    invoke-direct {p3}, Lcom/flyersoft/staticlayout/MyBulletSpan;-><init>()V

    move v2, v0

    :goto_1
    if-ge v2, v3, :cond_b

    .line 1646
    invoke-virtual {p1, v2}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v0

    if-ne v0, v7, :cond_b

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1648
    :cond_b
    move-object v0, v6

    check-cast v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$MyBullet;

    iget-object v1, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$MyBullet;->bullet:Ljava/lang/String;

    iput-object v1, p3, Lcom/flyersoft/staticlayout/MyBulletSpan;->bullet:Ljava/lang/String;

    .line 1649
    iget v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->ul_level:I

    iput v1, p3, Lcom/flyersoft/staticlayout/MyBulletSpan;->level:I

    .line 1650
    iput v2, p3, Lcom/flyersoft/staticlayout/MyBulletSpan;->spStart:I

    .line 1651
    iput v3, p3, Lcom/flyersoft/staticlayout/MyBulletSpan;->spEnd:I

    .line 1653
    iget-object v4, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$MyBullet;->style:Lcom/flyersoft/components/CSS$Style;

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    .line 1654
    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setFontStyles(Landroid/text/SpannableStringBuilder;IILcom/flyersoft/components/CSS$Style;Z)V

    move-object p1, v0

    move-object v8, v1

    if-eqz v4, :cond_c

    .line 1655
    iget v0, v4, Lcom/flyersoft/components/CSS$Style;->align:I

    if-lez v0, :cond_c

    .line 1656
    new-instance v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Alignment;

    iget v1, v4, Lcom/flyersoft/components/CSS$Style;->align:I

    invoke-direct {v0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Alignment;-><init>(I)V

    invoke-direct {p0, v8, v0, v2, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setAlignment(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Alignment;II)V

    :cond_c
    move v0, v2

    goto :goto_2

    :cond_d
    move-object v8, p1

    move-object p1, p0

    .line 1659
    :goto_2
    instance-of v1, v6, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$BlockQuote;

    if-eqz v1, :cond_10

    .line 1660
    move-object v1, v6

    check-cast v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$BlockQuote;

    iget-object v1, v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$BlockQuote;->style:Lcom/flyersoft/components/CSS$Style;

    invoke-static {v1}, Lcom/flyersoft/components/CSS;->hasParagraphProperty(Lcom/flyersoft/components/CSS$Style;)Z

    move-result v1

    if-eqz v1, :cond_e

    goto/16 :goto_4

    .line 1662
    :cond_e
    sget-boolean v1, Lcom/flyersoft/tools/A;->disableCSS:Z

    if-eqz v1, :cond_f

    sget-boolean v1, Lcom/flyersoft/tools/A;->cssLineSpace:Z

    if-eqz v1, :cond_f

    goto/16 :goto_4

    .line 1664
    :cond_f
    move-object v1, p3

    check-cast v1, Lcom/flyersoft/staticlayout/MyMarginSpan;

    iput v0, v1, Lcom/flyersoft/staticlayout/MyMarginSpan;->spStart:I

    .line 1665
    iput v3, v1, Lcom/flyersoft/staticlayout/MyMarginSpan;->spEnd:I

    .line 1666
    invoke-direct {p0, v1, v8, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->deleteTopMarginIfPriorHas(Lcom/flyersoft/staticlayout/MyMarginSpan;Landroid/text/SpannableStringBuilder;I)V

    .line 1669
    :cond_10
    instance-of v1, v6, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$MarginQuote;

    if-eqz v1, :cond_14

    move v4, v0

    :goto_3
    if-ge v4, v3, :cond_11

    .line 1670
    invoke-virtual {v8, v4}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v0

    if-ne v0, v7, :cond_11

    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 1672
    :cond_11
    move-object v0, v6

    check-cast v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$MarginQuote;

    .line 1673
    move-object v1, p3

    check-cast v1, Lcom/flyersoft/staticlayout/MyMarginSpan;

    .line 1674
    iget-object v2, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$MarginQuote;->tag:Ljava/lang/String;

    iget-object v0, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$MarginQuote;->style:Lcom/flyersoft/components/CSS$Style;

    move v5, v3

    move-object v3, v0

    move-object v0, p1

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setMarginSpanProperty(Lcom/flyersoft/staticlayout/MyMarginSpan;Ljava/lang/String;Lcom/flyersoft/components/CSS$Style;II)V

    move v3, v5

    if-ne v4, v3, :cond_13

    .line 1677
    sget-boolean p2, Lcom/flyersoft/tools/A;->trimBlankSpace:Z

    if-nez p2, :cond_1d

    .line 1678
    iget-object p2, v1, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object p2, p2, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    iget p2, p2, Landroid/graphics/RectF;->top:F

    const/4 p3, 0x0

    cmpl-float p2, p2, p3

    if-gtz p2, :cond_12

    iget-object p2, v1, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object p2, p2, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    iget p2, p2, Landroid/graphics/RectF;->bottom:F

    cmpl-float p2, p2, p3

    if-lez p2, :cond_1d

    .line 1679
    :cond_12
    invoke-direct {p0, v8}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBrSingle(Landroid/text/SpannableStringBuilder;)V

    .line 1680
    const-string p2, "\u00a0\n"

    invoke-virtual {v8, p2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1681
    iget p2, v1, Lcom/flyersoft/staticlayout/MyMarginSpan;->spEnd:I

    add-int/lit8 p2, p2, 0x1

    iput p2, v1, Lcom/flyersoft/staticlayout/MyMarginSpan;->spEnd:I

    .line 1682
    invoke-virtual {v8}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p2

    .line 1684
    new-instance p3, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-direct {p3, v0}, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;-><init>(F)V

    invoke-direct {p0, v8, p3, v4, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 1685
    invoke-direct {p0, v8, v1, v4, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    return-void

    .line 1690
    :cond_13
    invoke-direct {p0, v1, v8, v4}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->deleteTopMarginIfPriorHas(Lcom/flyersoft/staticlayout/MyMarginSpan;Landroid/text/SpannableStringBuilder;I)V

    move v0, v4

    :cond_14
    if-eq v0, v3, :cond_1d

    .line 1696
    iget-boolean v1, p1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->ignoreFamilyFace:Z

    if-nez v1, :cond_1a

    .line 1697
    sget-object v1, Lcom/flyersoft/staticlayout/MyHtml;->familyBoldItalic:Ljava/lang/String;

    if-eqz v1, :cond_18

    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Italic;

    if-eq p2, v1, :cond_15

    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Bold;

    if-ne p2, v1, :cond_18

    .line 1698
    :cond_15
    const-class v1, Lcom/flyersoft/staticlayout/MyTypefaceSpan;

    invoke-direct {p0, v8, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getLast(Landroid/text/Spanned;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_18

    .line 1699
    invoke-virtual {v8, v1}, Landroid/text/SpannableStringBuilder;->getSpanStart(Ljava/lang/Object;)I

    move-result v2

    if-ne v2, v0, :cond_18

    invoke-virtual {v8, v1}, Landroid/text/SpannableStringBuilder;->getSpanEnd(Ljava/lang/Object;)I

    move-result v2

    if-ne v2, v3, :cond_18

    .line 1700
    move-object v2, v1

    check-cast v2, Lcom/flyersoft/staticlayout/MyTypefaceSpan;

    invoke-virtual {v2}, Lcom/flyersoft/staticlayout/MyTypefaceSpan;->getFamily()Ljava/lang/String;

    move-result-object v2

    .line 1701
    const-class v4, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Italic;

    if-ne p2, v4, :cond_16

    sget-object v4, Lcom/flyersoft/staticlayout/MyHtml;->familyBold:Ljava/lang/String;

    invoke-static {v2, v4}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_17

    :cond_16
    const-class v4, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Bold;

    if-ne p2, v4, :cond_18

    sget-object v4, Lcom/flyersoft/staticlayout/MyHtml;->familyItalic:Ljava/lang/String;

    .line 1702
    invoke-static {v2, v4}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_18

    .line 1703
    :cond_17
    invoke-virtual {v8, v1}, Landroid/text/SpannableStringBuilder;->removeSpan(Ljava/lang/Object;)V

    .line 1704
    new-instance p2, Lcom/flyersoft/staticlayout/MyTypefaceSpan;

    sget-object p3, Lcom/flyersoft/staticlayout/MyHtml;->familyBoldItalic:Ljava/lang/String;

    invoke-direct {p2, p3}, Lcom/flyersoft/staticlayout/MyTypefaceSpan;-><init>(Ljava/lang/String;)V

    .line 1705
    invoke-direct {p0, v8, p2, v0, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    return-void

    .line 1710
    :cond_18
    sget-object v1, Lcom/flyersoft/staticlayout/MyHtml;->familyBold:Ljava/lang/String;

    if-eqz v1, :cond_19

    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Bold;

    if-ne p2, v1, :cond_19

    .line 1711
    new-instance p2, Lcom/flyersoft/staticlayout/MyTypefaceSpan;

    sget-object p3, Lcom/flyersoft/staticlayout/MyHtml;->familyBold:Ljava/lang/String;

    invoke-direct {p2, p3}, Lcom/flyersoft/staticlayout/MyTypefaceSpan;-><init>(Ljava/lang/String;)V

    .line 1712
    invoke-direct {p0, v8, p2, v0, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    return-void

    .line 1715
    :cond_19
    sget-object v1, Lcom/flyersoft/staticlayout/MyHtml;->familyItalic:Ljava/lang/String;

    if-eqz v1, :cond_1a

    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Italic;

    if-ne p2, v1, :cond_1a

    .line 1716
    new-instance p2, Lcom/flyersoft/staticlayout/MyTypefaceSpan;

    sget-object p3, Lcom/flyersoft/staticlayout/MyHtml;->familyItalic:Ljava/lang/String;

    invoke-direct {p2, p3}, Lcom/flyersoft/staticlayout/MyTypefaceSpan;-><init>(Ljava/lang/String;)V

    .line 1717
    invoke-direct {p0, v8, p2, v0, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    return-void

    .line 1722
    :cond_1a
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Emphasis_Tag;

    if-ne p2, v1, :cond_1b

    .line 1723
    move-object p2, p3

    check-cast p2, Lcom/flyersoft/staticlayout/MyHtml$Emphasis;

    move-object v1, v6

    check-cast v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Emphasis_Tag;

    iget-object v1, v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Emphasis_Tag;->emphasis:Ljava/lang/String;

    iput-object v1, p2, Lcom/flyersoft/staticlayout/MyHtml$Emphasis;->emphasis:Ljava/lang/String;

    .line 1725
    :cond_1b
    instance-of p2, v6, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Alignment;

    if-eqz p2, :cond_1c

    .line 1726
    check-cast v6, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Alignment;

    invoke-direct {p0, v8, v6, v0, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setAlignment(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Alignment;II)V

    return-void

    .line 1728
    :cond_1c
    invoke-direct {p0, v8, p3, v0, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    :cond_1d
    :goto_4
    return-void
.end method

.method private endA(Landroid/text/SpannableStringBuilder;)V
    .locals 6

    .line 2669
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    .line 2670
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Href;

    invoke-direct {p0, p1, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getLast(Landroid/text/Spanned;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 2674
    :cond_0
    invoke-virtual {p1, v1}, Landroid/text/SpannableStringBuilder;->getSpanStart(Ljava/lang/Object;)I

    move-result v2

    .line 2675
    invoke-virtual {p1, v1}, Landroid/text/SpannableStringBuilder;->removeSpan(Ljava/lang/Object;)V

    .line 2676
    check-cast v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Href;

    if-ne v2, v0, :cond_1

    .line 2679
    sget-boolean v0, Lcom/flyersoft/tools/A;->epubPageNum:Z

    if-eqz v0, :cond_2

    iget-object v0, v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Href;->mAttributes:Lorg/xml/sax/Attributes;

    if-eqz v0, :cond_2

    iget-object v0, v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Href;->mHref:Ljava/lang/String;

    if-nez v0, :cond_2

    .line 2680
    iget-object v0, v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Href;->mAttributes:Lorg/xml/sax/Attributes;

    const-string v1, "id"

    invoke-interface {v0, v1}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 2681
    const-string v1, "page"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 2682
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->addEpub3PrintEditionNumbers(Ljava/lang/String;Landroid/text/SpannableStringBuilder;)V

    return-void

    .line 2685
    :cond_1
    iget-object v3, v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Href;->mHref:Ljava/lang/String;

    if-nez v3, :cond_3

    :cond_2
    :goto_0
    return-void

    .line 2688
    :cond_3
    new-instance v3, Lcom/flyersoft/staticlayout/MyUrlSpan;

    iget-object v4, v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Href;->mHref:Ljava/lang/String;

    invoke-direct {v3, v4}, Lcom/flyersoft/staticlayout/MyUrlSpan;-><init>(Ljava/lang/String;)V

    .line 2690
    iget v4, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->chapterId:I

    invoke-direct {p0, v4}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getChapter(I)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v4

    if-eqz v4, :cond_4

    iget v4, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->chapterId:I

    invoke-direct {p0, v4}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getChapter(I)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v4

    iget-object v4, v4, Lcom/flyersoft/books/BaseEBook$Chapter;->css:Lcom/flyersoft/components/CSS;

    goto :goto_1

    :cond_4
    const/4 v4, 0x0

    :goto_1
    if-eqz v4, :cond_5

    .line 2692
    iget-object v5, v4, Lcom/flyersoft/components/CSS;->link_color:Ljava/lang/Integer;

    iput-object v5, v3, Lcom/flyersoft/staticlayout/MyUrlSpan;->link_color:Ljava/lang/Integer;

    .line 2693
    iget-object v5, v4, Lcom/flyersoft/components/CSS;->link_visited_color:Ljava/lang/Integer;

    iput-object v5, v3, Lcom/flyersoft/staticlayout/MyUrlSpan;->link_visited_color:Ljava/lang/Integer;

    .line 2694
    iget-boolean v4, v4, Lcom/flyersoft/components/CSS;->link_no_underline:Z

    iput-boolean v4, v3, Lcom/flyersoft/staticlayout/MyUrlSpan;->link_no_underline:Z

    .line 2697
    :cond_5
    const-string v4, "a"

    iget-object v1, v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Href;->mAttributes:Lorg/xml/sax/Attributes;

    invoke-direct {p0, v4, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getStyleFromAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Lcom/flyersoft/components/CSS$Style;

    move-result-object v1

    const/4 v4, 0x1

    if-eqz v1, :cond_7

    .line 2699
    iget-object v5, v1, Lcom/flyersoft/components/CSS$Style;->color:Ljava/lang/String;

    invoke-static {v5}, Lcom/flyersoft/tools/T;->getHtmlColor(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    if-eqz v5, :cond_6

    .line 2701
    iput-object v5, v3, Lcom/flyersoft/staticlayout/MyUrlSpan;->link_color:Ljava/lang/Integer;

    .line 2702
    :cond_6
    iget-object v5, v1, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    invoke-static {v5}, Lcom/flyersoft/components/CSS;->urlNoUnderline(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 2703
    iput-boolean v4, v3, Lcom/flyersoft/staticlayout/MyUrlSpan;->link_no_underline:Z

    .line 2705
    :cond_7
    invoke-direct {p0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->isSuperStyle(Lcom/flyersoft/components/CSS$Style;)Z

    move-result v1

    if-nez v1, :cond_8

    iget-object v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->cssStyles:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_9

    iget-object v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->cssStyles:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v5

    sub-int/2addr v5, v4

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/components/CSS$Style;

    invoke-direct {p0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->isSuperStyle(Lcom/flyersoft/components/CSS$Style;)Z

    move-result v1

    if-eqz v1, :cond_9

    :cond_8
    const v1, 0x3f4ccccd    # 0.8f

    .line 2706
    invoke-direct {p0, p1, v2, v0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSuperScriptSpan(Landroid/text/SpannableStringBuilder;IIF)V

    .line 2709
    :cond_9
    invoke-direct {p0, p1, v3, v2, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    return-void
.end method

.method private endCSS(Landroid/text/SpannableStringBuilder;Ljava/lang/String;)V
    .locals 6

    .line 1379
    invoke-direct {p0, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getLastCssStyle(Ljava/lang/String;)Lcom/flyersoft/components/CSS$Style;

    move-result-object p2

    .line 1380
    invoke-direct {p0, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->hasWhiteSpaceWrap(Lcom/flyersoft/components/CSS$Style;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 1381
    iput-boolean v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->preTagStart:Z

    .line 1383
    :cond_0
    iput-boolean v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->ignoreFamilyFace:Z

    .line 1384
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->fontTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x1

    if-lez v0, :cond_2

    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->fontTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    sub-int/2addr v3, v2

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p2, :cond_2

    .line 1385
    const-class v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Font;

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getLast(Landroid/text/Spanned;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Font;

    if-eqz v0, :cond_1

    .line 1386
    iget-object v3, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Font;->mFace:Ljava/lang/String;

    if-eqz v3, :cond_1

    sget-object v3, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-eqz v3, :cond_1

    sget-object v3, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    instance-of v3, v3, Lcom/flyersoft/books/Epub;

    if-eqz v3, :cond_1

    .line 1387
    sget-object v3, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    check-cast v3, Lcom/flyersoft/books/Epub;

    iget-object v0, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Font;->mFace:Ljava/lang/String;

    invoke-virtual {v3, v0, v1}, Lcom/flyersoft/books/Epub;->getFontFile(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1388
    iput-boolean v2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->ignoreFamilyFace:Z

    .line 1390
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->fontTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    sub-int/2addr v3, v2

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1391
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->spanBulder:Landroid/text/SpannableStringBuilder;

    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->endFont(Landroid/text/SpannableStringBuilder;)V

    .line 1394
    :cond_2
    invoke-direct {p0, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->isSuperStyle(Lcom/flyersoft/components/CSS$Style;)Z

    move-result v0

    const/4 v3, 0x0

    if-eqz v0, :cond_3

    .line 1395
    const-class v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Sup;

    invoke-direct {p0, p1, v0, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 1398
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->hideTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_4

    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->hideTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p2, :cond_4

    .line 1399
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->hideTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1400
    const-class v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Hide;

    invoke-direct {p0, p1, v0, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 1402
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->emphasisTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_5

    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->emphasisTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p2, :cond_5

    .line 1403
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->emphasisTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1404
    const-class v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Emphasis_Tag;

    new-instance v4, Lcom/flyersoft/staticlayout/MyHtml$Emphasis;

    invoke-direct {v4, v3}, Lcom/flyersoft/staticlayout/MyHtml$Emphasis;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1, v0, v4}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 1406
    :cond_5
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->boldTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_6

    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->boldTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p2, :cond_6

    .line 1407
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->boldTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1408
    const-class v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Bold;

    new-instance v4, Lcom/flyersoft/staticlayout/MyStyleSpan;

    invoke-direct {v4, v2}, Lcom/flyersoft/staticlayout/MyStyleSpan;-><init>(I)V

    invoke-direct {p0, p1, v0, v4}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 1410
    :cond_6
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->lightTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_7

    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->lightTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p2, :cond_7

    .line 1411
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->lightTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1412
    const-class v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Light;

    new-instance v4, Lcom/flyersoft/staticlayout/MyFontLightSpan;

    invoke-direct {v4}, Lcom/flyersoft/staticlayout/MyFontLightSpan;-><init>()V

    invoke-direct {p0, p1, v0, v4}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 1414
    :cond_7
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->italicTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_8

    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->italicTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p2, :cond_8

    .line 1415
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->italicTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1416
    const-class v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Italic;

    new-instance v4, Lcom/flyersoft/staticlayout/MyStyleSpan;

    const/4 v5, 0x2

    invoke-direct {v4, v5}, Lcom/flyersoft/staticlayout/MyStyleSpan;-><init>(I)V

    invoke-direct {p0, p1, v0, v4}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 1418
    :cond_8
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->underlineTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_9

    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->underlineTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p2, :cond_9

    .line 1419
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->underlineTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1420
    const-class v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Underline;

    new-instance v4, Landroid/text/style/UnderlineSpan;

    invoke-direct {v4}, Landroid/text/style/UnderlineSpan;-><init>()V

    invoke-direct {p0, p1, v0, v4}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 1422
    :cond_9
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->strikethroughTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_a

    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->strikethroughTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p2, :cond_a

    .line 1423
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->strikethroughTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1424
    const-class v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Strikethrough;

    new-instance v4, Landroid/text/style/StrikethroughSpan;

    invoke-direct {v4}, Landroid/text/style/StrikethroughSpan;-><init>()V

    invoke-direct {p0, p1, v0, v4}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 1426
    :cond_a
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->shadowTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_c

    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->shadowTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p2, :cond_c

    .line 1427
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->shadowTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1428
    const-class v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Shadow;

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getLast(Landroid/text/Spanned;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Shadow;

    .line 1429
    const-class v4, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Shadow;

    new-instance v5, Lcom/flyersoft/staticlayout/MyShadowSpan;

    if-nez v0, :cond_b

    move-object v0, v3

    goto :goto_0

    :cond_b
    iget-object v0, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Shadow;->property:Ljava/lang/String;

    :goto_0
    invoke-direct {v5, v0}, Lcom/flyersoft/staticlayout/MyShadowSpan;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1, v4, v5}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 1431
    :cond_c
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->fontSizeTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_d

    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->fontSizeTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p2, :cond_d

    .line 1432
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->fontSizeTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1433
    const-class v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Big;

    invoke-direct {p0, p1, v0, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 1435
    :cond_d
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->textFillColorTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_e

    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->textFillColorTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p2, :cond_e

    .line 1436
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->textFillColorTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1437
    const-class v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TextFillColor;

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getLast(Landroid/text/Spanned;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_e

    .line 1438
    invoke-virtual {p1, v0}, Landroid/text/SpannableStringBuilder;->removeSpan(Ljava/lang/Object;)V

    .line 1441
    :cond_e
    iput-boolean v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->hasBackgroundColor:Z

    .line 1442
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->backgroundColorTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_f

    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->backgroundColorTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p2, :cond_f

    .line 1443
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->backgroundColorTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1444
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->backgroundColorValue:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1445
    const-class v4, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$BackgroundColor;

    new-instance v5, Lcom/flyersoft/components/CSS$BackgroundColorSpan;

    invoke-direct {v5, v0}, Lcom/flyersoft/components/CSS$BackgroundColorSpan;-><init>(I)V

    invoke-direct {p0, p1, v4, v5}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 1446
    iput-boolean v2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->hasBackgroundColor:Z

    .line 1452
    :cond_f
    iput-boolean v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->hasBackgroundColor:Z

    .line 1454
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->marginTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_10

    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->marginTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p2, :cond_10

    .line 1455
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->marginTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1456
    const-class v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$MarginQuote;

    new-instance v4, Lcom/flyersoft/staticlayout/MyMarginSpan;

    const/4 v5, 0x0

    invoke-direct {v4, v5, v5, v5, v5}, Lcom/flyersoft/staticlayout/MyMarginSpan;-><init>(FFFF)V

    invoke-direct {p0, p1, v0, v4}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 1458
    :cond_10
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->alignTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_11

    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->alignTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p2, :cond_11

    .line 1459
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->alignTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1460
    const-class v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Alignment;

    invoke-direct {p0, p1, v0, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 1462
    :cond_11
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->floatTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_12

    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->floatTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p2, :cond_12

    .line 1463
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->floatTag:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1464
    const-class v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FloatQuote;

    invoke-direct {p0, p1, v0, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    :cond_12
    if-eqz p2, :cond_13

    .line 1467
    iget p2, p2, Lcom/flyersoft/components/CSS$Style;->pageBreak:I

    if-ne p2, v2, :cond_13

    .line 1468
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->insertPgaeBreak(Landroid/text/SpannableStringBuilder;)V

    .line 1470
    :cond_13
    iget-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tags:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lez p1, :cond_14

    .line 1471
    iget-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tags:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p2

    sub-int/2addr p2, v2

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1472
    iget-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->classes:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p2

    sub-int/2addr p2, v2

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1473
    iget-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->cssStyles:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p2

    sub-int/2addr p2, v2

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1475
    :cond_14
    iput-boolean v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->ignoreFamilyFace:Z

    return-void
.end method

.method private endFont(Landroid/text/SpannableStringBuilder;)V
    .locals 13

    .line 2583
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    .line 2584
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Font;

    invoke-direct {p0, p1, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getLast(Landroid/text/Spanned;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    goto/16 :goto_2

    .line 2587
    :cond_0
    invoke-virtual {p1, v1}, Landroid/text/SpannableStringBuilder;->getSpanStart(Ljava/lang/Object;)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_1

    goto/16 :goto_2

    .line 2590
    :cond_1
    invoke-virtual {p1, v1}, Landroid/text/SpannableStringBuilder;->removeSpan(Ljava/lang/Object;)V

    if-eq v2, v0, :cond_9

    .line 2593
    check-cast v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Font;

    .line 2595
    sget-boolean v3, Lcom/flyersoft/tools/A;->disableCSS:Z

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v3, :cond_2

    sget-boolean v3, Lcom/flyersoft/tools/A;->cssFontColor:Z

    if-eqz v3, :cond_2

    const/4 v3, 0x1

    goto :goto_0

    :cond_2
    const/4 v3, 0x0

    .line 2596
    :goto_0
    sget-boolean v6, Lcom/flyersoft/tools/A;->disableCSS:Z

    if-eqz v6, :cond_3

    sget-boolean v6, Lcom/flyersoft/tools/A;->cssFontSize:Z

    if-eqz v6, :cond_3

    const/4 v4, 0x1

    :cond_3
    if-nez v3, :cond_4

    .line 2598
    sget-boolean v6, Lcom/flyersoft/tools/A;->disableLinkColor:Z

    if-eqz v6, :cond_4

    const-class v6, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Href;

    invoke-direct {p0, p1, v6}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getLast(Landroid/text/Spanned;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_4

    const/4 v3, 0x1

    :cond_4
    if-nez v3, :cond_7

    .line 2601
    iget-object v3, v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Font;->mColor:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_7

    .line 2602
    iget-boolean v3, v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Font;->has_fill_color:Z

    if-nez v3, :cond_5

    const-class v3, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TextFillColor;

    invoke-direct {p0, p1, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getLast(Landroid/text/Spanned;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_7

    .line 2603
    :cond_5
    iget-object v3, v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Font;->mColor:Ljava/lang/String;

    const-string v6, "@"

    invoke-virtual {v3, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 2604
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v3

    .line 2605
    iget-object v6, v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Font;->mColor:Ljava/lang/String;

    invoke-virtual {v6, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 2606
    const-string v6, "color"

    const-string v7, "android"

    invoke-virtual {v3, v5, v6, v7}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    if-eqz v5, :cond_7

    const/4 v6, 0x0

    .line 2608
    invoke-static {v3, v5, v6}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/content/res/ColorStateList;

    move-result-object v11

    .line 2609
    new-instance v7, Landroid/text/style/TextAppearanceSpan;

    const/4 v10, 0x0

    const/4 v12, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v7 .. v12}, Landroid/text/style/TextAppearanceSpan;-><init>(Ljava/lang/String;IILandroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;)V

    invoke-direct {p0, p1, v7, v2, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto :goto_1

    .line 2611
    :cond_6
    iget-object v3, v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Font;->mColor:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_7

    .line 2612
    iget-object v3, v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Font;->mColor:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->getHtmlColor(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    if-eqz v3, :cond_7

    .line 2614
    iget-boolean v5, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->hasBackgroundColor:Z

    if-nez v5, :cond_7

    .line 2615
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-eqz v5, :cond_7

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/high16 v6, -0x1000000

    if-eq v5, v6, :cond_7

    .line 2616
    new-instance v5, Landroid/text/style/ForegroundColorSpan;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-direct {v5, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-direct {p0, p1, v5, v2, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 2621
    :cond_7
    :goto_1
    iget-object v3, v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Font;->mFace:Ljava/lang/String;

    if-eqz v3, :cond_8

    .line 2622
    iget-object v3, v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Font;->mFace:Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getTypefaceSpan(Ljava/lang/String;)Landroid/text/style/MetricAffectingSpan;

    move-result-object v3

    if-eqz v3, :cond_8

    .line 2624
    invoke-direct {p0, p1, v3, v2, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    :cond_8
    if-nez v4, :cond_9

    .line 2627
    iget v3, v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Font;->mSize:F

    const/4 v4, 0x0

    cmpl-float v3, v3, v4

    if-eqz v3, :cond_9

    .line 2628
    new-instance v3, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;

    iget v4, v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Font;->mSize:F

    invoke-direct {v3, v4}, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;-><init>(F)V

    .line 2629
    iget-boolean v1, v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Font;->fontSize_inherited:Z

    iput-boolean v1, v3, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;->inherited:Z

    .line 2630
    invoke-direct {p0, p1, v3, v2, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    :cond_9
    :goto_2
    return-void
.end method

.method private endHeader(Landroid/text/SpannableStringBuilder;)V
    .locals 5

    .line 2751
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    .line 2752
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Header;

    invoke-direct {p0, p1, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getLast(Landroid/text/Spanned;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_2

    .line 2755
    :cond_0
    invoke-virtual {p1, v1}, Landroid/text/SpannableStringBuilder;->getSpanStart(Ljava/lang/Object;)I

    move-result v2

    .line 2756
    invoke-virtual {p1, v1}, Landroid/text/SpannableStringBuilder;->removeSpan(Ljava/lang/Object;)V

    .line 2758
    check-cast v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Header;

    .line 2759
    iget-object v3, v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Header;->style:Lcom/flyersoft/components/CSS$Style;

    if-nez v3, :cond_3

    :goto_0
    if-le v0, v2, :cond_1

    add-int/lit8 v3, v0, -0x1

    .line 2761
    invoke-virtual {p1, v3}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v3

    const/16 v4, 0xa

    if-ne v3, v4, :cond_1

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    if-eq v2, v0, :cond_3

    .line 2766
    new-instance v3, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;

    invoke-static {v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Header;->-$$Nest$fgetfontSize(Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Header;)F

    move-result v1

    invoke-direct {v3, v1}, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;-><init>(F)V

    const/4 v1, 0x1

    .line 2767
    iput-boolean v1, v3, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;->inherited:Z

    .line 2768
    invoke-direct {p0, p1, v3, v2, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 2770
    sget-object v3, Lcom/flyersoft/staticlayout/MyHtml;->familyBold:Ljava/lang/String;

    if-eqz v3, :cond_2

    .line 2771
    new-instance v1, Lcom/flyersoft/staticlayout/MyTypefaceSpan;

    sget-object v3, Lcom/flyersoft/staticlayout/MyHtml;->familyBold:Ljava/lang/String;

    invoke-direct {v1, v3}, Lcom/flyersoft/staticlayout/MyTypefaceSpan;-><init>(Ljava/lang/String;)V

    .line 2772
    invoke-direct {p0, p1, v1, v2, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto :goto_1

    .line 2774
    :cond_2
    new-instance v3, Lcom/flyersoft/staticlayout/MyStyleSpan;

    invoke-direct {v3, v1}, Lcom/flyersoft/staticlayout/MyStyleSpan;-><init>(I)V

    invoke-direct {p0, p1, v3, v2, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 2778
    :cond_3
    :goto_1
    sget-boolean v0, Lcom/flyersoft/tools/A;->trimBlankSpace:Z

    if-eqz v0, :cond_4

    .line 2779
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBr2(Landroid/text/SpannableStringBuilder;)V

    :cond_4
    :goto_2
    return-void
.end method

.method private endRuby(Landroid/text/SpannableStringBuilder;Z)V
    .locals 4

    .line 1089
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    .line 1090
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$RubyTag;

    invoke-direct {p0, p1, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getLast(Landroid/text/Spanned;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_2

    .line 1093
    :cond_0
    invoke-virtual {p1, v1}, Landroid/text/SpannableStringBuilder;->getSpanStart(Ljava/lang/Object;)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_1

    goto :goto_2

    .line 1096
    :cond_1
    invoke-virtual {p1, v1}, Landroid/text/SpannableStringBuilder;->removeSpan(Ljava/lang/Object;)V

    if-nez p2, :cond_5

    if-eq v2, v0, :cond_5

    .line 1098
    iget-boolean p2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->hasBr:Z

    if-nez p2, :cond_2

    const/4 p2, 0x1

    .line 1099
    iput-boolean p2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->hasBr:Z

    const/4 p2, 0x0

    .line 1100
    const-string v1, "\n"

    invoke-virtual {p1, p2, v1}, Landroid/text/SpannableStringBuilder;->insert(ILjava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v0, v0, 0x1

    :cond_2
    :goto_0
    add-int/lit8 p2, v0, -0x1

    if-ge v2, p2, :cond_3

    .line 1104
    invoke-virtual {p1, v2}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result p2

    invoke-static {p2}, Lcom/flyersoft/tools/A;->isBlankChar(C)Z

    move-result p2

    if-eqz p2, :cond_3

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    :goto_1
    add-int/lit8 p2, v0, -0x1

    if-le p2, v2, :cond_4

    .line 1106
    invoke-virtual {p1, p2}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result p2

    invoke-static {p2}, Lcom/flyersoft/tools/A;->isBlankChar(C)Z

    move-result p2

    if-eqz p2, :cond_4

    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 1108
    :cond_4
    new-instance p2, Lcom/flyersoft/staticlayout/MyHtml$Ruby;

    iget-object v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->rubyRtText:Ljava/lang/String;

    const-string v3, ""

    invoke-direct {p2, v1, v3, v2, v0}, Lcom/flyersoft/staticlayout/MyHtml$Ruby;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-direct {p0, p1, p2, v2, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    :cond_5
    :goto_2
    return-void
.end method

.method private endRubyRt(Landroid/text/SpannableStringBuilder;)V
    .locals 7

    .line 1123
    iget-boolean v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->rubyRtStart:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1124
    const-class v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Small;

    new-instance v2, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;

    const/high16 v3, 0x3f000000    # 0.5f

    invoke-direct {v2, v3}, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;-><init>(F)V

    invoke-direct {p0, p1, v0, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    goto/16 :goto_5

    .line 1127
    :cond_0
    const-class v0, Lcom/flyersoft/staticlayout/MyHtml$Ruby;

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getLast(Landroid/text/Spanned;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1129
    check-cast v0, Lcom/flyersoft/staticlayout/MyHtml$Ruby;

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 1131
    :goto_0
    invoke-direct {p0, p1, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->endRuby(Landroid/text/SpannableStringBuilder;Z)V

    .line 1132
    const-class v2, Lcom/flyersoft/staticlayout/MyHtml$Ruby;

    invoke-direct {p0, p1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getLast(Landroid/text/Spanned;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_7

    .line 1135
    check-cast v2, Lcom/flyersoft/staticlayout/MyHtml$Ruby;

    .line 1136
    iget-object v3, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->rubyRtText:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->rt:Ljava/lang/String;

    .line 1137
    iget v3, v2, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->start:I

    iget v4, v2, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->end:I

    invoke-virtual {p1, v3, v4}, Landroid/text/SpannableStringBuilder;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->original:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 1139
    iget v3, v0, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->end:I

    iget v4, v2, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->start:I

    if-ne v3, v4, :cond_7

    .line 1141
    iget-object v3, v0, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->rt:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    iget v4, v0, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->end:I

    iget v5, v0, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->start:I

    sub-int/2addr v4, v5

    const/4 v5, 0x2

    mul-int/lit8 v4, v4, 0x2

    if-le v3, v4, :cond_2

    .line 1142
    iget-object v3, v0, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->rt:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    iget v4, v0, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->end:I

    iget v0, v0, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->start:I

    sub-int/2addr v4, v0

    mul-int/lit8 v4, v4, 0x2

    sub-int/2addr v3, v4

    goto :goto_1

    :cond_2
    const/4 v3, 0x0

    .line 1143
    :goto_1
    iget-object v0, v2, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->rt:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    iget v4, v2, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->end:I

    iget v6, v2, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->start:I

    sub-int/2addr v4, v6

    mul-int/lit8 v4, v4, 0x2

    if-le v0, v4, :cond_3

    .line 1144
    iget-object v0, v2, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->rt:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    iget v4, v2, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->end:I

    iget v6, v2, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->start:I

    sub-int/2addr v4, v6

    mul-int/lit8 v4, v4, 0x2

    sub-int/2addr v0, v4

    add-int/2addr v3, v0

    :cond_3
    if-lez v3, :cond_7

    const/4 v0, 0x3

    if-eq v3, v5, :cond_5

    if-ne v3, v0, :cond_4

    goto :goto_2

    .line 1146
    :cond_4
    const-string v4, " "

    goto :goto_3

    :cond_5
    :goto_2
    const-string v4, "\u3000"

    :goto_3
    if-le v3, v0, :cond_6

    .line 1148
    div-int/2addr v3, v0

    const/4 v0, 0x0

    :goto_4
    if-ge v0, v3, :cond_6

    .line 1149
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v4, 0x3000

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 1151
    :cond_6
    iget v0, v2, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->start:I

    invoke-virtual {p1, v0, v4}, Landroid/text/SpannableStringBuilder;->insert(ILjava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1152
    iget v0, v2, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->start:I

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v0, v3

    iput v0, v2, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->start:I

    .line 1153
    iget v0, v2, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->end:I

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v0, v3

    iput v0, v2, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->end:I

    .line 1154
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v2, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->original:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->original:Ljava/lang/String;

    .line 1159
    :cond_7
    iget-boolean v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->rubyRbStart:Z

    if-nez v0, :cond_8

    .line 1160
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->startRuby(Landroid/text/SpannableStringBuilder;)V

    .line 1163
    :cond_8
    :goto_5
    iput-boolean v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->rubyRtStart:Z

    return-void
.end method

.method public static equals(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0

    if-eq p0, p1, :cond_1

    if-eqz p0, :cond_0

    .line 1758
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

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

.method private fillInheritValue(Lcom/flyersoft/components/CSS$Style;)V
    .locals 3

    if-nez p1, :cond_0

    goto/16 :goto_3

    .line 1028
    :cond_0
    iget-object v0, p1, Lcom/flyersoft/components/CSS$Style;->color:Ljava/lang/String;

    const-string v1, "inherit"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->cssStyles:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 1029
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->cssStyles:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_2

    .line 1030
    iget-object v2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->cssStyles:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->cssStyles:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/components/CSS$Style;

    iget-object v2, v2, Lcom/flyersoft/components/CSS$Style;->color:Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 1031
    iget-object v2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->cssStyles:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/CSS$Style;

    iget-object v0, v0, Lcom/flyersoft/components/CSS$Style;->color:Ljava/lang/String;

    iput-object v0, p1, Lcom/flyersoft/components/CSS$Style;->color:Ljava/lang/String;

    goto :goto_1

    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 1034
    :cond_2
    :goto_1
    iget-object v0, p1, Lcom/flyersoft/components/CSS$Style;->fontFace:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->cssStyles:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 1035
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->cssStyles:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_2
    if-ltz v0, :cond_4

    .line 1036
    iget-object v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->cssStyles:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->cssStyles:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->fontFace:Ljava/lang/String;

    if-eqz v1, :cond_3

    .line 1037
    iget-object v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->cssStyles:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/CSS$Style;

    iget-object v0, v0, Lcom/flyersoft/components/CSS$Style;->fontFace:Ljava/lang/String;

    iput-object v0, p1, Lcom/flyersoft/components/CSS$Style;->fontFace:Ljava/lang/String;

    return-void

    :cond_3
    add-int/lit8 v0, v0, -0x1

    goto :goto_2

    :cond_4
    :goto_3
    return-void
.end method

.method private getChapter(I)Lcom/flyersoft/books/BaseEBook$Chapter;
    .locals 1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    .line 1487
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v0, p1}, Lcom/flyersoft/books/BaseEBook;->get(I)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method private getLast(Landroid/text/Spanned;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 2

    const/4 v0, 0x0

    .line 1551
    invoke-interface {p1}, Landroid/text/Spanned;->length()I

    move-result v1

    invoke-interface {p1, v0, v1, p2}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p1

    .line 1553
    array-length p2, p1

    if-nez p2, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 1556
    :cond_0
    array-length p2, p1

    add-int/lit8 p2, p2, -0x1

    aget-object p1, p1, p2

    return-object p1
.end method

.method private getLastAlignValue(Landroid/text/SpannableStringBuilder;)I
    .locals 3

    .line 1491
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Alignment;

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v0, v1}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Alignment;

    .line 1492
    array-length v0, p1

    if-nez v0, :cond_0

    return v2

    :cond_0
    array-length v0, p1

    add-int/lit8 v0, v0, -0x1

    aget-object p1, p1, v0

    iget p1, p1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Alignment;->align:I

    return p1
.end method

.method private getLastCssStyle(Ljava/lang/String;)Lcom/flyersoft/components/CSS$Style;
    .locals 2

    .line 1480
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tags:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_1

    .line 1481
    iget-object v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tags:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1482
    iget-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->cssStyles:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/components/CSS$Style;

    return-object p1

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private getLiTag()Ljava/lang/String;
    .locals 3

    .line 1061
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->li_tag:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 1062
    sget-object v0, Lcom/flyersoft/staticlayout/MyHtml;->LI_TAG:Ljava/lang/String;

    return-object v0

    .line 1063
    :cond_0
    iget v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->ul_level:I

    const/4 v2, 0x1

    if-le v1, v2, :cond_1

    const-string v1, "\u2022"

    const-string v2, "\u25cb"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    :cond_1
    return-object v0
.end method

.method private getLineHeight()I
    .locals 4

    .line 2526
    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    sget-object v1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MRTextView;->getInLineHeight(Landroid/graphics/Paint;)I

    move-result v0

    .line 2527
    iget-object v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->cssStyles:Ljava/util/ArrayList;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 2528
    iget-object v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->cssStyles:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/components/CSS$Style;

    if-eqz v1, :cond_0

    .line 2529
    iget v2, v1, Lcom/flyersoft/components/CSS$Style;->fontSize:F

    const/high16 v3, 0x3f800000    # 1.0f

    cmpl-float v2, v2, v3

    if-lez v2, :cond_0

    int-to-float v0, v0

    .line 2530
    iget v1, v1, Lcom/flyersoft/components/CSS$Style;->fontSize:F

    mul-float v0, v0, v1

    float-to-int v0, v0

    :cond_0
    return v0
.end method

.method private getStyleFromAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Lcom/flyersoft/components/CSS$Style;
    .locals 7

    .line 1011
    const-string v0, "class"

    invoke-direct {p0, p2, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getValue(Lorg/xml/sax/Attributes;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1012
    const-string v0, "id"

    invoke-direct {p0, p2, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getValue(Lorg/xml/sax/Attributes;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1013
    iget v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->chapterId:I

    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getChapter(I)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v4

    iget-object v5, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tags:Ljava/util/ArrayList;

    iget-object v6, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->classes:Ljava/util/ArrayList;

    move-object v1, p1

    invoke-static/range {v1 .. v6}, Lcom/flyersoft/staticlayout/MyHtml;->getClassStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/flyersoft/books/BaseEBook$Chapter;Ljava/util/ArrayList;Ljava/util/ArrayList;)Lcom/flyersoft/components/CSS$Style;

    move-result-object p1

    .line 1014
    const-string v0, "style"

    if-nez p2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1015
    :goto_0
    sget-boolean v3, Lcom/flyersoft/staticlayout/MyHtml;->isFb2:Z

    if-eqz v3, :cond_1

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p2, :cond_1

    .line 1016
    const-string v0, "name"

    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_1
    if-eqz v2, :cond_2

    .line 1018
    new-instance p2, Lcom/flyersoft/components/CSS$Style;

    invoke-direct {p2, p1}, Lcom/flyersoft/components/CSS$Style;-><init>(Lcom/flyersoft/components/CSS$Style;)V

    .line 1019
    invoke-virtual {p2, v2}, Lcom/flyersoft/components/CSS$Style;->scanPropertyForStyle(Ljava/lang/String;)V

    move-object p1, p2

    .line 1021
    :cond_2
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->fillInheritValue(Lcom/flyersoft/components/CSS$Style;)V

    return-object p1
.end method

.method private getTableHtml(I)Ljava/lang/String;
    .locals 1

    .line 2947
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->initTabletHtmls()V

    .line 2948
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableHtmls:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 2949
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableHtmls:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method private getTypefaceSpan(Ljava/lang/String;)Landroid/text/style/MetricAffectingSpan;
    .locals 3

    .line 2636
    const-string v0, "inherit"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 2639
    :cond_0
    iget v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->chapterId:I

    invoke-static {v0}, Lcom/flyersoft/staticlayout/MyHtml;->getCssFontList(I)Ljava/util/ArrayList;

    move-result-object v0

    .line 2640
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2641
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2643
    :cond_1
    sget-boolean v0, Lcom/flyersoft/tools/A;->useCssFont:Z

    if-eqz v0, :cond_4

    .line 2644
    invoke-static {p1}, Lcom/flyersoft/tools/A;->isInnerFontName(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_3

    .line 2645
    invoke-static {p1, v2}, Lcom/flyersoft/tools/A;->fontInEpubIgnored(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    return-object v1

    .line 2647
    :cond_2
    new-instance v0, Landroid/text/style/TypefaceSpan;

    invoke-direct {v0, p1}, Landroid/text/style/TypefaceSpan;-><init>(Ljava/lang/String;)V

    return-object v0

    :cond_3
    const/4 v0, 0x1

    .line 2649
    invoke-static {p1, v2, v0, v0}, Lcom/flyersoft/tools/A;->getTypeFace2(Ljava/lang/String;IZZ)Landroid/graphics/Typeface;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 2650
    new-instance v0, Lcom/flyersoft/staticlayout/MyTypefaceSpan;

    invoke-direct {v0, p1}, Lcom/flyersoft/staticlayout/MyTypefaceSpan;-><init>(Ljava/lang/String;)V

    return-object v0

    :cond_4
    return-object v1
.end method

.method private getValue(Lorg/xml/sax/Attributes;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 1045
    :cond_0
    invoke-interface {p1, p2}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_1

    return-object v0

    .line 1046
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private handleBr(Landroid/text/SpannableStringBuilder;)V
    .locals 1

    .line 1522
    sget-boolean v0, Lcom/flyersoft/tools/A;->trimBlankSpace:Z

    if-eqz v0, :cond_0

    .line 1523
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBrSingle(Landroid/text/SpannableStringBuilder;)V

    return-void

    .line 1525
    :cond_0
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBr2(Landroid/text/SpannableStringBuilder;)V

    return-void
.end method

.method private handleBr2(Landroid/text/SpannableStringBuilder;)V
    .locals 1

    .line 1542
    iget v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->floatSpanType:I

    if-lez v0, :cond_0

    return-void

    .line 1544
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->savedImgAttributesForNextChar:Lorg/xml/sax/Attributes;

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 1545
    iput-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->savedImgAttributesForNextChar:Lorg/xml/sax/Attributes;

    :cond_1
    const/16 v0, 0xa

    .line 1546
    invoke-virtual {p1, v0}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    const/4 p1, 0x1

    .line 1547
    iput-boolean p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->hasBr:Z

    return-void
.end method

.method private handleBrDouble(Landroid/text/SpannableStringBuilder;)V
    .locals 2

    .line 1535
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    sub-int/2addr v0, v1

    invoke-virtual {p1, v0}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v0

    const/16 v1, 0xa

    if-ne v0, v1, :cond_0

    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x2

    invoke-virtual {p1, v0}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v0

    if-ne v0, v1, :cond_0

    return-void

    .line 1537
    :cond_0
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBr2(Landroid/text/SpannableStringBuilder;)V

    return-void
.end method

.method private handleBrSingle(Landroid/text/SpannableStringBuilder;)V
    .locals 2

    .line 1529
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p1, v0}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v0

    const/16 v1, 0xa

    if-ne v0, v1, :cond_0

    return-void

    .line 1531
    :cond_0
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBr2(Landroid/text/SpannableStringBuilder;)V

    return-void
.end method

.method private handleEndTag(Ljava/lang/String;)V
    .locals 6

    .line 840
    iget-boolean v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->ignoreStart:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 841
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->isFootnoteTag(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "rp"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/flyersoft/staticlayout/MyHtml;->isFb2:Z

    if-nez v0, :cond_31

    const-string v0, "style"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_31

    .line 842
    :cond_0
    iput-boolean v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->ignoreStart:Z

    return-void

    .line 845
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->displayNoneTag:Ljava/lang/String;

    const/4 v2, 0x0

    if-eqz v0, :cond_2

    .line 846
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_31

    .line 847
    iput-object v2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->displayNoneTag:Ljava/lang/String;

    return-void

    .line 851
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->spanBulder:Landroid/text/SpannableStringBuilder;

    .line 852
    iput-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->lastEndTag:Ljava/lang/String;

    .line 854
    const-string v3, "p"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 855
    iget v2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->td_start:I

    if-nez v2, :cond_30

    .line 856
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getLastCssStyle(Ljava/lang/String;)Lcom/flyersoft/components/CSS$Style;

    move-result-object v2

    invoke-direct {p0, v0, v2, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleP(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/components/CSS$Style;Z)V

    goto/16 :goto_6

    .line 857
    :cond_3
    const-string v3, "div"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_4

    .line 858
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getLastCssStyle(Ljava/lang/String;)Lcom/flyersoft/components/CSS$Style;

    move-result-object v1

    .line 859
    invoke-direct {p0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->styleHasInlineDisplay(Lcom/flyersoft/components/CSS$Style;)Z

    move-result v2

    if-nez v2, :cond_30

    .line 860
    invoke-direct {p0, v0, v1, v4}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleP(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/components/CSS$Style;Z)V

    goto/16 :goto_6

    .line 861
    :cond_4
    const-string v3, "span"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 862
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getLastCssStyle(Ljava/lang/String;)Lcom/flyersoft/components/CSS$Style;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->styleHasBlockDisplay(Lcom/flyersoft/components/CSS$Style;)Z

    move-result v1

    if-eqz v1, :cond_30

    .line 863
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBrSingle(Landroid/text/SpannableStringBuilder;)V

    goto/16 :goto_6

    .line 864
    :cond_5
    const-string v3, "br"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 865
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBr(Landroid/text/SpannableStringBuilder;)V

    goto/16 :goto_6

    .line 866
    :cond_6
    invoke-static {p1}, Lcom/flyersoft/components/CSS;->isHeaderTag(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 867
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getLastCssStyle(Ljava/lang/String;)Lcom/flyersoft/components/CSS$Style;

    move-result-object v2

    invoke-direct {p0, v0, v2, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleP(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/components/CSS$Style;Z)V

    .line 868
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->endHeader(Landroid/text/SpannableStringBuilder;)V

    goto/16 :goto_6

    .line 869
    :cond_7
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->isFootnoteTag(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 870
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->endCSS(Landroid/text/SpannableStringBuilder;Ljava/lang/String;)V

    goto/16 :goto_6

    .line 871
    :cond_8
    const-string v3, "ruby"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 872
    iget-boolean v2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->rubyRbStart:Z

    if-nez v2, :cond_9

    .line 873
    invoke-direct {p0, v0, v4}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->endRuby(Landroid/text/SpannableStringBuilder;Z)V

    .line 874
    :cond_9
    const-string v2, ""

    iput-object v2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->rubyRtText:Ljava/lang/String;

    .line 875
    iput-boolean v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->rubyRbStart:Z

    iput-boolean v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->rubyStart:Z

    goto/16 :goto_6

    .line 876
    :cond_a
    const-string v3, "rt"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 877
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->endRubyRt(Landroid/text/SpannableStringBuilder;)V

    goto/16 :goto_6

    .line 878
    :cond_b
    const-string v3, "code"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const-string v5, "monospace"

    if-nez v3, :cond_2f

    const-string v3, "tt"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2f

    const-string v3, "kbd"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    goto/16 :goto_5

    .line 886
    :cond_c
    const-string v3, "pre"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d

    .line 887
    iput-boolean v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->preTagStart:Z

    .line 888
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBrSingle(Landroid/text/SpannableStringBuilder;)V

    .line 889
    const-class v3, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$PreQuote;

    invoke-direct {p0, v0, v3, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 890
    const-class v3, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Monospace;

    new-instance v4, Lcom/flyersoft/staticlayout/MyTypefaceSpan;

    invoke-direct {v4, v5}, Lcom/flyersoft/staticlayout/MyTypefaceSpan;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, v3, v4}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 891
    invoke-direct {p0, v0, v2, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleP(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/components/CSS$Style;Z)V

    .line 892
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->removeTagCache()V

    goto/16 :goto_6

    .line 893
    :cond_d
    const-string v3, "audio"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2e

    const-string v3, "video"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    goto/16 :goto_4

    .line 895
    :cond_e
    const-string v3, "center"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_f

    .line 896
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Alignment;

    invoke-direct {p0, v0, v1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    goto/16 :goto_6

    .line 897
    :cond_f
    const-string v3, "figure"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2d

    const-string v3, "figcaption"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_10

    goto/16 :goto_3

    .line 900
    :cond_10
    const-string v3, "dl"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_11

    .line 901
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->endCSS(Landroid/text/SpannableStringBuilder;Ljava/lang/String;)V

    .line 902
    invoke-direct {p0, v0, v2, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleP(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/components/CSS$Style;Z)V

    goto/16 :goto_6

    .line 903
    :cond_11
    const-string v3, "dt"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_12

    .line 904
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FontQuote;

    invoke-direct {p0, v0, v1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 905
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBrSingle(Landroid/text/SpannableStringBuilder;)V

    .line 906
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->removeTagCache()V

    goto/16 :goto_6

    .line 907
    :cond_12
    const-string v3, "dd"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_13

    .line 908
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FontQuote;

    invoke-direct {p0, v0, v1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 909
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBr(Landroid/text/SpannableStringBuilder;)V

    .line 910
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$BlockQuote;

    new-instance v2, Lcom/flyersoft/staticlayout/MyMarginSpan;

    invoke-static {}, Lcom/flyersoft/components/CSS;->MARGIN_HORI()F

    move-result v3

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4, v4, v4}, Lcom/flyersoft/staticlayout/MyMarginSpan;-><init>(FFFF)V

    invoke-direct {p0, v0, v1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    goto/16 :goto_6

    .line 911
    :cond_13
    const-string v3, "table"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_14

    .line 912
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableQuote;

    invoke-direct {p0, v0, v1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 913
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBr(Landroid/text/SpannableStringBuilder;)V

    goto/16 :goto_6

    .line 914
    :cond_14
    const-string v3, "tr"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_15

    .line 915
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBr(Landroid/text/SpannableStringBuilder;)V

    .line 916
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableQuote;

    invoke-direct {p0, v0, v1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    goto/16 :goto_6

    .line 917
    :cond_15
    const-string v3, "td"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2c

    const-string v3, "th"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_16

    goto/16 :goto_2

    .line 921
    :cond_16
    const-string v3, "ul"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_17

    .line 922
    sget-object v3, Lcom/flyersoft/staticlayout/MyHtml;->LI_TAG:Ljava/lang/String;

    iput-object v3, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->li_tag:Ljava/lang/String;

    .line 923
    iget v3, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->ul_level:I

    sub-int/2addr v3, v4

    iput v3, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->ul_level:I

    .line 924
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBrSingle(Landroid/text/SpannableStringBuilder;)V

    .line 925
    iput-boolean v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->UL_statement:Z

    .line 926
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$ULQuote;

    invoke-direct {p0, v0, v1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 927
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->removeTagCache()V

    goto/16 :goto_6

    .line 928
    :cond_17
    const-string v3, "ol"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_18

    .line 929
    iput v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->ol_value:I

    .line 930
    iget v3, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->ul_level:I

    sub-int/2addr v3, v4

    iput v3, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->ul_level:I

    .line 931
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBrSingle(Landroid/text/SpannableStringBuilder;)V

    .line 932
    iput-boolean v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->UL_statement:Z

    .line 933
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$ULQuote;

    invoke-direct {p0, v0, v1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    goto/16 :goto_6

    .line 934
    :cond_18
    const-string v3, "li"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_19

    .line 935
    iput-boolean v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->LI_statement:Z

    .line 936
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$MyBullet;

    invoke-direct {p0, v0, v1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 937
    iget-boolean v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->UL_statement:Z

    if-nez v1, :cond_30

    .line 938
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$ULQuote;

    invoke-direct {p0, v0, v1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    goto/16 :goto_6

    .line 939
    :cond_19
    const-string v3, "em"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v5, 0x2

    if-eqz v3, :cond_1a

    .line 940
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Italic;

    new-instance v3, Lcom/flyersoft/staticlayout/MyStyleSpan;

    invoke-direct {v3, v5}, Lcom/flyersoft/staticlayout/MyStyleSpan;-><init>(I)V

    invoke-direct {p0, v0, v1, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 941
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FontQuote;

    invoke-direct {p0, v0, v1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    goto/16 :goto_6

    .line 942
    :cond_1a
    const-string v3, "b"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1b

    .line 943
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Bold;

    new-instance v2, Lcom/flyersoft/staticlayout/MyStyleSpan;

    invoke-direct {v2, v4}, Lcom/flyersoft/staticlayout/MyStyleSpan;-><init>(I)V

    invoke-direct {p0, v0, v1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    goto/16 :goto_6

    .line 944
    :cond_1b
    const-string v3, "strong"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1c

    .line 946
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FontQuote;

    invoke-direct {p0, v0, v1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    goto/16 :goto_6

    .line 947
    :cond_1c
    const-string v3, "cite"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1d

    .line 948
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Italic;

    new-instance v2, Lcom/flyersoft/staticlayout/MyStyleSpan;

    invoke-direct {v2, v5}, Lcom/flyersoft/staticlayout/MyStyleSpan;-><init>(I)V

    invoke-direct {p0, v0, v1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    goto/16 :goto_6

    .line 949
    :cond_1d
    const-string v3, "i"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1e

    .line 950
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Italic;

    new-instance v2, Lcom/flyersoft/staticlayout/MyStyleSpan;

    invoke-direct {v2, v5}, Lcom/flyersoft/staticlayout/MyStyleSpan;-><init>(I)V

    invoke-direct {p0, v0, v1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    goto/16 :goto_6

    .line 951
    :cond_1e
    const-string v3, "big"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1f

    .line 952
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Big;

    invoke-direct {p0, v0, v1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    goto/16 :goto_6

    .line 953
    :cond_1f
    const-string v3, "small"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const v4, 0x3f4ccccd    # 0.8f

    if-eqz v3, :cond_20

    .line 954
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Small;

    new-instance v2, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;

    invoke-direct {v2, v4}, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;-><init>(F)V

    invoke-direct {p0, v0, v1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    goto/16 :goto_6

    .line 955
    :cond_20
    const-string v3, "font"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_21

    .line 956
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->endFont(Landroid/text/SpannableStringBuilder;)V

    goto/16 :goto_6

    .line 957
    :cond_21
    const-string v3, "blockquote"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_24

    .line 958
    sget-boolean v3, Lcom/flyersoft/tools/A;->disableCSS:Z

    if-eqz v3, :cond_23

    sget-boolean v3, Lcom/flyersoft/tools/A;->cssLineSpace:Z

    if-nez v3, :cond_22

    goto :goto_0

    .line 962
    :cond_22
    invoke-direct {p0, v0, v2, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleP(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/components/CSS$Style;Z)V

    goto/16 :goto_6

    .line 959
    :cond_23
    :goto_0
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBrSingle(Landroid/text/SpannableStringBuilder;)V

    .line 960
    const-class v2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$BlockQuote;

    new-instance v3, Lcom/flyersoft/staticlayout/MyMarginSpan;

    invoke-direct {v3, v1}, Lcom/flyersoft/staticlayout/MyMarginSpan;-><init>(I)V

    invoke-direct {p0, v0, v2, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    goto/16 :goto_6

    .line 963
    :cond_24
    const-string v2, "a"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_25

    .line 964
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->endA(Landroid/text/SpannableStringBuilder;)V

    goto/16 :goto_6

    .line 965
    :cond_25
    const-string v2, "u"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_26

    .line 966
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Underline;

    new-instance v2, Landroid/text/style/UnderlineSpan;

    invoke-direct {v2}, Landroid/text/style/UnderlineSpan;-><init>()V

    invoke-direct {p0, v0, v1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    goto/16 :goto_6

    .line 967
    :cond_26
    const-string v2, "del"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2b

    const-string v2, "s"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2b

    const-string v2, "strike"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_27

    goto :goto_1

    .line 969
    :cond_27
    const-string v2, "sup"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_28

    .line 970
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Super;

    new-instance v2, Lcom/flyersoft/staticlayout/MySuperscriptSpan;

    invoke-direct {v2}, Lcom/flyersoft/staticlayout/MySuperscriptSpan;-><init>()V

    invoke-direct {p0, v0, v1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 971
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Small;

    new-instance v2, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;

    invoke-direct {v2, v4}, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;-><init>(F)V

    invoke-direct {p0, v0, v1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    goto/16 :goto_6

    .line 972
    :cond_28
    const-string v2, "sub"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_29

    .line 973
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Sub;

    new-instance v2, Lcom/flyersoft/staticlayout/MySubscriptSpan;

    invoke-direct {v2}, Lcom/flyersoft/staticlayout/MySubscriptSpan;-><init>()V

    invoke-direct {p0, v0, v1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 974
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Small;

    new-instance v2, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;

    const v3, 0x3f266666    # 0.65f

    invoke-direct {v2, v3}, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;-><init>(F)V

    invoke-direct {p0, v0, v1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    goto :goto_6

    .line 975
    :cond_29
    iget-object v2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->mTagHandler:Lcom/flyersoft/staticlayout/MyHtml$TagHandler;

    if-eqz v2, :cond_2a

    .line 976
    iget-object v3, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->mReader:Lorg/xml/sax/XMLReader;

    invoke-interface {v2, v1, p1, v0, v3}, Lcom/flyersoft/staticlayout/MyHtml$TagHandler;->handleTag(ZLjava/lang/String;Landroid/text/Editable;Lorg/xml/sax/XMLReader;)V

    goto :goto_6

    .line 977
    :cond_2a
    const-string v1, "nav"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_30

    .line 978
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBr(Landroid/text/SpannableStringBuilder;)V

    .line 979
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->removeTagCache()V

    goto :goto_6

    .line 968
    :cond_2b
    :goto_1
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Strikethrough;

    new-instance v2, Landroid/text/style/StrikethroughSpan;

    invoke-direct {v2}, Landroid/text/style/StrikethroughSpan;-><init>()V

    invoke-direct {p0, v0, v1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    goto :goto_6

    .line 918
    :cond_2c
    :goto_2
    iput v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->td_start:I

    .line 919
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v1

    if-lez v1, :cond_30

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v1

    sub-int/2addr v1, v4

    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v1

    const/16 v2, 0xa

    if-eq v1, v2, :cond_30

    .line 920
    const-string v1, "\u3000 "

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->appendText(Landroid/text/SpannableStringBuilder;Ljava/lang/String;)V

    goto :goto_6

    .line 898
    :cond_2d
    :goto_3
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->endCSS(Landroid/text/SpannableStringBuilder;Ljava/lang/String;)V

    .line 899
    invoke-direct {p0, v0, v2, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleP(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/components/CSS$Style;Z)V

    goto :goto_6

    .line 894
    :cond_2e
    :goto_4
    iput v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->mediaTagStart:I

    goto :goto_6

    .line 879
    :cond_2f
    :goto_5
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FontQuote;

    invoke-direct {p0, v0, v1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 880
    const-class v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Monospace;

    new-instance v2, Lcom/flyersoft/staticlayout/MyTypefaceSpan;

    invoke-direct {v2, v5}, Lcom/flyersoft/staticlayout/MyTypefaceSpan;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, v1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->end(Landroid/text/SpannableStringBuilder;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 984
    :cond_30
    :goto_6
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->cssUsedTag(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_31

    .line 985
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->endCSS(Landroid/text/SpannableStringBuilder;Ljava/lang/String;)V

    .line 986
    const-string v1, "fieldset"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_31

    .line 987
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBr(Landroid/text/SpannableStringBuilder;)V

    :cond_31
    return-void
.end method

.method private handleP(Landroid/text/SpannableStringBuilder;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 1496
    invoke-direct {p0, p1, v0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleP(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/components/CSS$Style;Z)V

    return-void
.end method

.method private handleP(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/components/CSS$Style;Z)V
    .locals 3

    .line 1500
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_2

    add-int/lit8 v1, v0, -0x1

    .line 1502
    invoke-virtual {p1, v1}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v1

    const/16 v2, 0xa

    if-ne v1, v2, :cond_2

    const/4 v1, 0x2

    if-lt v0, v1, :cond_0

    sub-int/2addr v0, v1

    .line 1503
    invoke-virtual {p1, v0}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v0

    if-ne v0, v2, :cond_0

    goto :goto_0

    .line 1505
    :cond_0
    invoke-static {p2}, Lcom/flyersoft/components/CSS;->hasParagraphProperty(Lcom/flyersoft/components/CSS$Style;)Z

    move-result p2

    if-eqz p2, :cond_1

    goto :goto_0

    :cond_1
    if-nez p3, :cond_4

    .line 1508
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBr(Landroid/text/SpannableStringBuilder;)V

    return-void

    :cond_2
    if-eqz v0, :cond_4

    .line 1513
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBr(Landroid/text/SpannableStringBuilder;)V

    .line 1514
    invoke-static {p2}, Lcom/flyersoft/components/CSS;->hasParagraphProperty(Lcom/flyersoft/components/CSS$Style;)Z

    move-result p2

    if-eqz p2, :cond_3

    goto :goto_0

    :cond_3
    if-nez p3, :cond_4

    .line 1517
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBr(Landroid/text/SpannableStringBuilder;)V

    :cond_4
    :goto_0
    return-void
.end method

.method private handleStartTag(Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 9

    .line 661
    iget-boolean v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->ignoreStart:Z

    if-nez v0, :cond_43

    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->displayNoneTag:Ljava/lang/String;

    if-eqz v0, :cond_0

    goto/16 :goto_c

    .line 664
    :cond_0
    sget v0, Lcom/flyersoft/staticlayout/MyHtml;->tagCount:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    sput v0, Lcom/flyersoft/staticlayout/MyHtml;->tagCount:I

    .line 665
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->spanBulder:Landroid/text/SpannableStringBuilder;

    .line 667
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->cssUsedTag(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    .line 668
    invoke-direct {p0, v0, p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->startCSS(Landroid/text/SpannableStringBuilder;Ljava/lang/String;Lorg/xml/sax/Attributes;)Lcom/flyersoft/components/CSS$Style;

    move-result-object v2

    goto :goto_0

    :cond_1
    move-object v2, v3

    .line 671
    :goto_0
    iget v4, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->mediaTagStart:I

    const-string v5, "src"

    const/4 v6, -0x1

    const/4 v7, 0x0

    if-ne v4, v6, :cond_2

    const-string v4, "source"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 672
    invoke-interface {p2, v5}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    iget-object v4, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->mediaTag:Ljava/lang/String;

    if-eqz v4, :cond_2

    .line 673
    invoke-direct {p0, v4, p2, v7}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->startImg(Ljava/lang/String;Lorg/xml/sax/Attributes;Z)V

    .line 678
    :cond_2
    const-string v4, "p"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 679
    iget-boolean p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->LI_statement:Z

    if-eqz p1, :cond_3

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p1

    sub-int/2addr p1, v1

    invoke-virtual {v0, p1}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result p1

    const/16 p2, 0xa

    if-eq p1, p2, :cond_43

    :cond_3
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p1

    iget p2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->td_start:I

    if-le p1, p2, :cond_43

    .line 680
    invoke-direct {p0, v0, v2, v7}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleP(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/components/CSS$Style;Z)V

    return-void

    .line 681
    :cond_4
    const-string v4, "div"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 682
    invoke-direct {p0, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->styleHasInlineDisplay(Lcom/flyersoft/components/CSS$Style;)Z

    move-result p1

    if-nez p1, :cond_43

    .line 683
    invoke-direct {p0, v0, v2, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleP(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/components/CSS$Style;Z)V

    return-void

    .line 684
    :cond_5
    const-string v4, "span"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 685
    invoke-direct {p0, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->styleHasBlockDisplay(Lcom/flyersoft/components/CSS$Style;)Z

    move-result p1

    if-eqz p1, :cond_43

    .line 686
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBrSingle(Landroid/text/SpannableStringBuilder;)V

    return-void

    .line 687
    :cond_6
    const-string v4, "br"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    goto/16 :goto_c

    .line 690
    :cond_7
    const-string v4, "hr"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 691
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->appendHR(Landroid/text/SpannableStringBuilder;)V

    return-void

    .line 692
    :cond_8
    const-string v4, "hr2"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 693
    invoke-direct {p0, v0, v3, v7}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleP(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/components/CSS$Style;Z)V

    .line 694
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->insertPgaeBreak(Landroid/text/SpannableStringBuilder;)V

    return-void

    .line 695
    :cond_9
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->isFootnoteTag(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 696
    const-string v2, "epub:type"

    invoke-interface {p2, v2}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "footnote"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 697
    iput-boolean v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->ignoreStart:Z

    return-void

    .line 699
    :cond_a
    invoke-direct {p0, v0, p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->startCSS(Landroid/text/SpannableStringBuilder;Ljava/lang/String;Lorg/xml/sax/Attributes;)Lcom/flyersoft/components/CSS$Style;

    return-void

    .line 700
    :cond_b
    const-string v4, "ruby"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c

    .line 701
    iput-boolean v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->rubyStart:Z

    .line 702
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->startRuby(Landroid/text/SpannableStringBuilder;)V

    return-void

    .line 703
    :cond_c
    const-string v4, "rb"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    .line 704
    iput-boolean v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->rubyRbStart:Z

    .line 705
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->startRuby(Landroid/text/SpannableStringBuilder;)V

    return-void

    .line 706
    :cond_d
    const-string v4, "rt"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_e

    .line 707
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->startRubyRt(Landroid/text/SpannableStringBuilder;)V

    return-void

    .line 708
    :cond_e
    const-string v4, "rp"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_42

    sget-boolean v4, Lcom/flyersoft/staticlayout/MyHtml;->isFb2:Z

    if-nez v4, :cond_f

    const-string v4, "style"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_f

    goto/16 :goto_b

    .line 710
    :cond_f
    const-string v4, "code"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_41

    const-string v4, "tt"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_41

    const-string v4, "kbd"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    goto/16 :goto_a

    .line 714
    :cond_10
    const-string v4, "pre"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    .line 715
    iput-boolean v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->preTagStart:Z

    .line 716
    invoke-direct {p0, v0, v3, v7}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleP(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/components/CSS$Style;Z)V

    .line 717
    new-instance v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Monospace;

    invoke-direct {v1, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Monospace;-><init>(Lcom/flyersoft/staticlayout/HtmlToSpannedConverter-IA;)V

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    .line 718
    new-instance v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$PreQuote;

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getStyleFromAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Lcom/flyersoft/components/CSS$Style;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$PreQuote;-><init>(Lcom/flyersoft/components/CSS$Style;)V

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    .line 719
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->addTagCache(Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    return-void

    .line 720
    :cond_11
    const-string v4, "center"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_12

    .line 721
    new-instance p1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Alignment;

    const/4 p2, 0x3

    invoke-direct {p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Alignment;-><init>(I)V

    invoke-direct {p0, v0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    return-void

    .line 722
    :cond_12
    const-string v4, "figure"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_40

    const-string v4, "figcaption"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_13

    goto/16 :goto_9

    .line 725
    :cond_13
    const-string v4, "dl"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_14

    .line 726
    invoke-direct {p0, v0, v3, v7}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleP(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/components/CSS$Style;Z)V

    .line 727
    invoke-direct {p0, v0, p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->startCSS(Landroid/text/SpannableStringBuilder;Ljava/lang/String;Lorg/xml/sax/Attributes;)Lcom/flyersoft/components/CSS$Style;

    return-void

    .line 728
    :cond_14
    const-string v4, "dt"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_15

    .line 729
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBrSingle(Landroid/text/SpannableStringBuilder;)V

    .line 730
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->addTagCache(Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 731
    new-instance v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FontQuote;

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getStyleFromAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Lcom/flyersoft/components/CSS$Style;

    move-result-object p2

    invoke-direct {v1, p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FontQuote;-><init>(Ljava/lang/String;Lcom/flyersoft/components/CSS$Style;)V

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    return-void

    .line 732
    :cond_15
    const-string v4, "dd"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_16

    .line 733
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBrSingle(Landroid/text/SpannableStringBuilder;)V

    .line 734
    new-instance v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$BlockQuote;

    invoke-direct {v1, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$BlockQuote;-><init>(Lcom/flyersoft/components/CSS$Style;)V

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    .line 735
    new-instance v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FontQuote;

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getStyleFromAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Lcom/flyersoft/components/CSS$Style;

    move-result-object p2

    invoke-direct {v1, p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FontQuote;-><init>(Ljava/lang/String;Lcom/flyersoft/components/CSS$Style;)V

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    return-void

    .line 736
    :cond_16
    const-string v4, "table"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_17

    .line 737
    invoke-direct {p0, v0, v3, v7}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleP(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/components/CSS$Style;Z)V

    .line 738
    new-instance v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableQuote;

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getStyleFromAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Lcom/flyersoft/components/CSS$Style;

    move-result-object p2

    invoke-direct {v1, p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableQuote;-><init>(Ljava/lang/String;Lcom/flyersoft/components/CSS$Style;)V

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    return-void

    .line 739
    :cond_17
    const-string v4, "tr"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_18

    .line 740
    new-instance v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableQuote;

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getStyleFromAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Lcom/flyersoft/components/CSS$Style;

    move-result-object p2

    invoke-direct {v1, p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableQuote;-><init>(Ljava/lang/String;Lcom/flyersoft/components/CSS$Style;)V

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    return-void

    .line 741
    :cond_18
    const-string v4, "td"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3f

    const-string v4, "th"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_19

    goto/16 :goto_8

    .line 743
    :cond_19
    const-string v4, "ul"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    const-string v8, "ol"

    if-nez v4, :cond_3b

    invoke-virtual {p1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1a

    goto/16 :goto_7

    .line 760
    :cond_1a
    const-string v4, "li"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_20

    .line 761
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getStyleFromAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Lcom/flyersoft/components/CSS$Style;

    move-result-object v2

    .line 762
    invoke-direct {p0, v2, p2, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->displayNone(Lcom/flyersoft/components/CSS$Style;Lorg/xml/sax/Attributes;Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1b

    goto/16 :goto_c

    .line 764
    :cond_1b
    invoke-direct {p0, p1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setLiTag(Ljava/lang/String;Lcom/flyersoft/components/CSS$Style;)V

    .line 765
    iget p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->ol_value:I

    if-lez p1, :cond_1c

    iget-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->li_tag:Ljava/lang/String;

    if-eqz p1, :cond_1c

    const-string p2, " \u3000"

    invoke-virtual {p1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1c

    .line 766
    iput v7, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->ol_value:I

    .line 767
    :cond_1c
    iget p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->ol_value:I

    if-lez p1, :cond_1d

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget p2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->ol_value:I

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ".\u3000"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_1d
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getLiTag()Ljava/lang/String;

    move-result-object p1

    .line 768
    :goto_1
    iget p2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->ol_value:I

    if-lez p2, :cond_1e

    add-int/2addr p2, v1

    .line 769
    iput p2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->ol_value:I

    .line 770
    :cond_1e
    iput-boolean v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->LI_statement:Z

    .line 771
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBrSingle(Landroid/text/SpannableStringBuilder;)V

    .line 772
    iget-boolean p2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->UL_statement:Z

    if-nez p2, :cond_1f

    .line 773
    new-instance p2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$ULQuote;

    invoke-direct {p2, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$ULQuote;-><init>(Lcom/flyersoft/components/CSS$Style;)V

    invoke-direct {p0, v0, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    .line 774
    :cond_1f
    new-instance p2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$MyBullet;

    invoke-direct {p2, p1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$MyBullet;-><init>(Ljava/lang/String;Lcom/flyersoft/components/CSS$Style;)V

    invoke-direct {p0, v0, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    return-void

    .line 775
    :cond_20
    const-string v4, "em"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_21

    .line 776
    new-instance v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Italic;

    invoke-direct {v1, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Italic;-><init>(Lcom/flyersoft/staticlayout/HtmlToSpannedConverter-IA;)V

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    .line 777
    new-instance v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FontQuote;

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getStyleFromAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Lcom/flyersoft/components/CSS$Style;

    move-result-object p2

    invoke-direct {v1, p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FontQuote;-><init>(Ljava/lang/String;Lcom/flyersoft/components/CSS$Style;)V

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    return-void

    .line 778
    :cond_21
    const-string v4, "b"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_22

    .line 779
    new-instance p1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Bold;

    invoke-direct {p1, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Bold;-><init>(Lcom/flyersoft/staticlayout/HtmlToSpannedConverter-IA;)V

    invoke-direct {p0, v0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    return-void

    .line 780
    :cond_22
    const-string v4, "strong"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_23

    .line 781
    new-instance v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FontQuote;

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getStyleFromAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Lcom/flyersoft/components/CSS$Style;

    move-result-object p2

    invoke-direct {v1, p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FontQuote;-><init>(Ljava/lang/String;Lcom/flyersoft/components/CSS$Style;)V

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    return-void

    .line 782
    :cond_23
    const-string v4, "cite"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_24

    .line 783
    new-instance p1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Italic;

    invoke-direct {p1, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Italic;-><init>(Lcom/flyersoft/staticlayout/HtmlToSpannedConverter-IA;)V

    invoke-direct {p0, v0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    return-void

    .line 784
    :cond_24
    const-string v4, "i"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_25

    .line 785
    new-instance p1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Italic;

    invoke-direct {p1, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Italic;-><init>(Lcom/flyersoft/staticlayout/HtmlToSpannedConverter-IA;)V

    invoke-direct {p0, v0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    return-void

    .line 786
    :cond_25
    const-string v4, "big"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_26

    .line 787
    new-instance v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Big;

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getStyleFromAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Lcom/flyersoft/components/CSS$Style;

    move-result-object p2

    invoke-direct {v1, p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Big;-><init>(Ljava/lang/String;Lcom/flyersoft/components/CSS$Style;)V

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    return-void

    .line 788
    :cond_26
    const-string v4, "small"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_27

    .line 789
    new-instance p1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Small;

    invoke-direct {p1, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Small;-><init>(Lcom/flyersoft/staticlayout/HtmlToSpannedConverter-IA;)V

    invoke-direct {p0, v0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    return-void

    .line 790
    :cond_27
    const-string v4, "font"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_28

    .line 791
    invoke-direct {p0, v0, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->startHtmlFont(Landroid/text/SpannableStringBuilder;Lorg/xml/sax/Attributes;)V

    return-void

    .line 792
    :cond_28
    const-string v4, "blockquote"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2b

    .line 793
    sget-boolean p1, Lcom/flyersoft/tools/A;->disableCSS:Z

    if-eqz p1, :cond_2a

    sget-boolean p1, Lcom/flyersoft/tools/A;->cssLineSpace:Z

    if-nez p1, :cond_29

    goto :goto_2

    .line 797
    :cond_29
    invoke-direct {p0, v0, v3, v7}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleP(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/components/CSS$Style;Z)V

    return-void

    .line 794
    :cond_2a
    :goto_2
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBrSingle(Landroid/text/SpannableStringBuilder;)V

    .line 795
    new-instance p1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$BlockQuote;

    invoke-direct {p1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$BlockQuote;-><init>(Lcom/flyersoft/components/CSS$Style;)V

    invoke-direct {p0, v0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    return-void

    .line 798
    :cond_2b
    const-string v4, "a"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2c

    .line 799
    invoke-direct {p0, v0, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->startA(Landroid/text/SpannableStringBuilder;Lorg/xml/sax/Attributes;)V

    return-void

    .line 800
    :cond_2c
    const-string v4, "u"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2d

    .line 801
    new-instance p1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Underline;

    invoke-direct {p1, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Underline;-><init>(Lcom/flyersoft/staticlayout/HtmlToSpannedConverter-IA;)V

    invoke-direct {p0, v0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    return-void

    .line 802
    :cond_2d
    const-string v4, "del"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3a

    const-string v4, "s"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3a

    const-string v4, "strike"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2e

    goto/16 :goto_6

    .line 804
    :cond_2e
    const-string v4, "sup"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2f

    .line 805
    new-instance p1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Small;

    invoke-direct {p1, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Small;-><init>(Lcom/flyersoft/staticlayout/HtmlToSpannedConverter-IA;)V

    invoke-direct {p0, v0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    .line 806
    new-instance p1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Super;

    invoke-direct {p1, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Super;-><init>(Lcom/flyersoft/staticlayout/HtmlToSpannedConverter-IA;)V

    invoke-direct {p0, v0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    return-void

    .line 807
    :cond_2f
    const-string v4, "sub"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_30

    .line 808
    new-instance p1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Small;

    invoke-direct {p1, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Small;-><init>(Lcom/flyersoft/staticlayout/HtmlToSpannedConverter-IA;)V

    invoke-direct {p0, v0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    .line 809
    new-instance p1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Sub;

    invoke-direct {p1, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Sub;-><init>(Lcom/flyersoft/staticlayout/HtmlToSpannedConverter-IA;)V

    invoke-direct {p0, v0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    return-void

    .line 810
    :cond_30
    invoke-static {p1}, Lcom/flyersoft/components/CSS;->isHeaderTag(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_32

    .line 811
    sget-boolean p2, Lcom/flyersoft/tools/A;->trimBlankSpace:Z

    if-eqz p2, :cond_31

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p2

    if-le p2, v1, :cond_31

    .line 812
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBr2(Landroid/text/SpannableStringBuilder;)V

    goto :goto_3

    .line 814
    :cond_31
    invoke-direct {p0, v0, v2, v7}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleP(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/components/CSS$Style;Z)V

    .line 815
    :goto_3
    new-instance p2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Header;

    invoke-direct {p2, p1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Header;-><init>(Ljava/lang/String;Lcom/flyersoft/components/CSS$Style;)V

    invoke-direct {p0, v0, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    return-void

    .line 816
    :cond_32
    const-string v2, "img"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const-string v3, "video"

    const-string v4, "audio"

    if-nez v2, :cond_36

    const-string v2, "image"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_36

    .line 817
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_36

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_33

    goto :goto_4

    .line 827
    :cond_33
    iget-object v2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->mTagHandler:Lcom/flyersoft/staticlayout/MyHtml$TagHandler;

    if-eqz v2, :cond_34

    .line 828
    iget-object p2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->mReader:Lorg/xml/sax/XMLReader;

    invoke-interface {v2, v1, p1, v0, p2}, Lcom/flyersoft/staticlayout/MyHtml$TagHandler;->handleTag(ZLjava/lang/String;Landroid/text/Editable;Lorg/xml/sax/XMLReader;)V

    return-void

    .line 829
    :cond_34
    const-string v1, "nav"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_43

    .line 830
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getStyleFromAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Lcom/flyersoft/components/CSS$Style;

    move-result-object v1

    invoke-direct {p0, v1, p2, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->displayNone(Lcom/flyersoft/components/CSS$Style;Lorg/xml/sax/Attributes;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_35

    goto/16 :goto_c

    .line 832
    :cond_35
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBr(Landroid/text/SpannableStringBuilder;)V

    .line 833
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->addTagCache(Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    return-void

    .line 818
    :cond_36
    :goto_4
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_38

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_37

    goto :goto_5

    .line 826
    :cond_37
    invoke-direct {p0, p1, p2, v7}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->startImg(Ljava/lang/String;Lorg/xml/sax/Attributes;Z)V

    return-void

    .line 819
    :cond_38
    :goto_5
    iput-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->mediaTag:Ljava/lang/String;

    .line 820
    invoke-interface {p2, v5}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_39

    .line 821
    iput v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->mediaTagStart:I

    .line 822
    invoke-direct {p0, p1, p2, v7}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->startImg(Ljava/lang/String;Lorg/xml/sax/Attributes;Z)V

    return-void

    .line 824
    :cond_39
    iput v6, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->mediaTagStart:I

    return-void

    .line 803
    :cond_3a
    :goto_6
    new-instance p1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Strikethrough;

    invoke-direct {p1, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Strikethrough;-><init>(Lcom/flyersoft/staticlayout/HtmlToSpannedConverter-IA;)V

    invoke-direct {p0, v0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    return-void

    .line 744
    :cond_3b
    :goto_7
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getStyleFromAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Lcom/flyersoft/components/CSS$Style;

    move-result-object v2

    .line 745
    invoke-direct {p0, v2, p2, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->displayNone(Lcom/flyersoft/components/CSS$Style;Lorg/xml/sax/Attributes;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3c

    goto :goto_c

    .line 747
    :cond_3c
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBrSingle(Landroid/text/SpannableStringBuilder;)V

    .line 748
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->addTagCache(Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 749
    sget-object v3, Lcom/flyersoft/staticlayout/MyHtml;->LI_TAG:Ljava/lang/String;

    iput-object v3, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->li_tag:Ljava/lang/String;

    .line 750
    iget v3, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->ul_level:I

    add-int/2addr v3, v1

    iput v3, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->ul_level:I

    .line 751
    invoke-direct {p0, p1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setLiTag(Ljava/lang/String;Lcom/flyersoft/components/CSS$Style;)V

    .line 752
    invoke-virtual {p1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3e

    if-eqz v2, :cond_3d

    iget-object p1, v2, Lcom/flyersoft/components/CSS$Style;->ul_style:Ljava/lang/String;

    if-eqz p1, :cond_3d

    iget-object p1, v2, Lcom/flyersoft/components/CSS$Style;->ul_style:Ljava/lang/String;

    const-string v3, "none"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3e

    .line 753
    :cond_3d
    iput v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->ol_value:I

    .line 754
    const-string p1, "start"

    invoke-direct {p0, p2, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getValue(Lorg/xml/sax/Attributes;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_3e

    .line 756
    invoke-static {p1}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->ol_value:I

    .line 758
    :cond_3e
    iput-boolean v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->UL_statement:Z

    .line 759
    new-instance p1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$ULQuote;

    invoke-direct {p1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$ULQuote;-><init>(Lcom/flyersoft/components/CSS$Style;)V

    invoke-direct {p0, v0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    return-void

    .line 742
    :cond_3f
    :goto_8
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p1

    iput p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->td_start:I

    return-void

    .line 723
    :cond_40
    :goto_9
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBrSingle(Landroid/text/SpannableStringBuilder;)V

    .line 724
    invoke-direct {p0, v0, p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->startCSS(Landroid/text/SpannableStringBuilder;Ljava/lang/String;Lorg/xml/sax/Attributes;)Lcom/flyersoft/components/CSS$Style;

    return-void

    .line 711
    :cond_41
    :goto_a
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v1

    iput v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->code_start:I

    .line 712
    new-instance v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Monospace;

    invoke-direct {v1, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Monospace;-><init>(Lcom/flyersoft/staticlayout/HtmlToSpannedConverter-IA;)V

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    .line 713
    new-instance v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FontQuote;

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getStyleFromAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Lcom/flyersoft/components/CSS$Style;

    move-result-object p2

    invoke-direct {v1, p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FontQuote;-><init>(Ljava/lang/String;Lcom/flyersoft/components/CSS$Style;)V

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    return-void

    .line 709
    :cond_42
    :goto_b
    iput-boolean v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->ignoreStart:Z

    :cond_43
    :goto_c
    return-void
.end method

.method private hasWhiteSpaceWrap(Lcom/flyersoft/components/CSS$Style;)Z
    .locals 2

    if-eqz p1, :cond_1

    .line 1348
    iget-object v0, p1, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p1, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    const-string v1, "white-space"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1349
    iget-object v0, p1, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    const-string v1, "pre-wrap"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object p1, p1, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    const-string v0, "pre-line"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    :cond_0
    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method private initCssTagList()V
    .locals 1

    .line 1358
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->floatTag:Ljava/util/ArrayList;

    .line 1359
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->emphasisTag:Ljava/util/ArrayList;

    .line 1360
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->hideTag:Ljava/util/ArrayList;

    .line 1361
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->boldTag:Ljava/util/ArrayList;

    .line 1362
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->lightTag:Ljava/util/ArrayList;

    .line 1363
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->italicTag:Ljava/util/ArrayList;

    .line 1364
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->underlineTag:Ljava/util/ArrayList;

    .line 1365
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->strikethroughTag:Ljava/util/ArrayList;

    .line 1366
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->shadowTag:Ljava/util/ArrayList;

    .line 1367
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->fontSizeTag:Ljava/util/ArrayList;

    .line 1368
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->textFillColorTag:Ljava/util/ArrayList;

    .line 1369
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->fontTag:Ljava/util/ArrayList;

    .line 1370
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->alignTag:Ljava/util/ArrayList;

    .line 1371
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->backgroundColorTag:Ljava/util/ArrayList;

    .line 1372
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->backgroundColorValue:Ljava/util/ArrayList;

    .line 1373
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->marginTag:Ljava/util/ArrayList;

    return-void
.end method

.method private initTabletHtmls()V
    .locals 13

    .line 2955
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableHtmls:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    goto/16 :goto_2

    .line 2958
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableHtmls:Ljava/util/ArrayList;

    .line 2959
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->mSource:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 2963
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x7

    .line 2965
    const-string v2, "<table"

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 2966
    const-string v3, "<tr"

    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, -0x1

    if-eq v3, v6, :cond_1

    if-eq v2, v6, :cond_3

    if-le v2, v3, :cond_1

    goto :goto_0

    .line 2971
    :cond_1
    const-string v3, "<td"

    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-eq v3, v6, :cond_2

    if-eq v2, v6, :cond_3

    if-le v2, v3, :cond_2

    goto :goto_0

    :cond_2
    const/4 v3, 0x0

    const/4 v5, 0x0

    :cond_3
    :goto_0
    move v2, v3

    const/4 v3, 0x0

    :cond_4
    :goto_1
    if-ge v3, v1, :cond_c

    add-int/lit8 v6, v3, 0x1

    .line 2979
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v8, 0x3c

    if-ne v7, v8, :cond_b

    .line 2980
    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v8, 0x65

    const/16 v9, 0x6c

    const/16 v10, 0x62

    const/16 v11, 0x61

    const/16 v12, 0x74

    if-ne v7, v12, :cond_7

    add-int/lit8 v6, v3, 0x2

    add-int/lit8 v7, v3, 0x3

    .line 2982
    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v6, v11, :cond_6

    add-int/lit8 v6, v3, 0x4

    .line 2983
    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-ne v7, v10, :cond_b

    add-int/lit8 v7, v3, 0x5

    .line 2984
    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v6, v9, :cond_6

    add-int/lit8 v6, v3, 0x6

    .line 2985
    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-ne v7, v8, :cond_b

    add-int/lit8 v7, v5, 0x1

    if-nez v5, :cond_5

    move v2, v3

    :cond_5
    move v3, v6

    move v5, v7

    goto :goto_1

    :cond_6
    move v3, v7

    goto :goto_1

    .line 2988
    :cond_7
    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x2f

    if-ne v6, v7, :cond_a

    add-int/lit8 v6, v3, 0x2

    add-int/lit8 v7, v3, 0x3

    .line 2990
    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v6, v12, :cond_6

    add-int/lit8 v6, v3, 0x4

    .line 2991
    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-ne v7, v11, :cond_b

    add-int/lit8 v7, v3, 0x5

    .line 2992
    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v6, v10, :cond_6

    add-int/lit8 v6, v3, 0x6

    .line 2993
    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-ne v7, v9, :cond_b

    add-int/lit8 v7, v3, 0x7

    .line 2994
    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v6, v8, :cond_6

    add-int/lit8 v3, v3, 0x8

    .line 2995
    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x3e

    if-ne v6, v7, :cond_4

    add-int/lit8 v6, v5, -0x1

    if-nez v6, :cond_8

    .line 2997
    iget-object v6, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableHtmls:Ljava/util/ArrayList;

    iget-object v7, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->mSource:Ljava/lang/String;

    invoke-virtual {v7, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_8
    if-lez v5, :cond_9

    add-int/lit8 v5, v5, -0x1

    goto/16 :goto_1

    :cond_9
    const/4 v5, 0x0

    goto/16 :goto_1

    :cond_a
    add-int/lit8 v3, v3, 0x2

    goto/16 :goto_1

    :cond_b
    move v3, v6

    goto/16 :goto_1

    :cond_c
    :goto_2
    return-void
.end method

.method private insertPgaeBreak(Landroid/text/SpannableStringBuilder;)V
    .locals 3

    .line 1562
    const-class v0, Lcom/flyersoft/components/CSS$PAGE_BREAK;

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getLast(Landroid/text/Spanned;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1564
    invoke-virtual {p1, v0}, Landroid/text/SpannableStringBuilder;->getSpanStart(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    .line 1566
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v1

    if-lt v0, v1, :cond_0

    goto :goto_0

    :cond_0
    add-int/lit8 v2, v1, -0xa

    if-le v0, v2, :cond_1

    .line 1569
    invoke-static {p1, v0, v1}, Lcom/flyersoft/tools/A;->isEmtpyText(Ljava/lang/CharSequence;II)Z

    move-result v0

    if-eqz v0, :cond_1

    :goto_0
    return-void

    .line 1574
    :cond_1
    new-instance v0, Lcom/flyersoft/components/CSS$PAGE_BREAK;

    invoke-direct {v0}, Lcom/flyersoft/components/CSS$PAGE_BREAK;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    return-void
.end method

.method private isFootnoteTag(Ljava/lang/String;)Z
    .locals 1

    .line 993
    sget-boolean v0, Lcom/flyersoft/tools/A;->footnoteInChapterText:Z

    if-nez v0, :cond_0

    const-string v0, "aside"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private isHeightAndWidthOnlyAuto(Lcom/flyersoft/components/CSS$Style;)Z
    .locals 2

    .line 2517
    iget-object v0, p1, Lcom/flyersoft/components/CSS$Style;->height:Ljava/lang/String;

    const-string v1, "auto"

    if-nez v0, :cond_0

    .line 2518
    iget-object p1, p1, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    .line 2519
    :cond_0
    iget-object v0, p1, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 2520
    iget-object p1, p1, Lcom/flyersoft/components/CSS$Style;->height:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    .line 2522
    :cond_1
    iget-object v0, p1, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object p1, p1, Lcom/flyersoft/components/CSS$Style;->height:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    const/4 p1, 0x1

    return p1

    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method private isSuperStyle(Lcom/flyersoft/components/CSS$Style;)Z
    .locals 2

    if-eqz p1, :cond_0

    .line 2747
    iget-object v0, p1, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    const-string v1, "vertical-align"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p1, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    const-string v0, "super"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private rebuildImageWhileNextCharNotBr()V
    .locals 3

    .line 2548
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->spanBulder:Landroid/text/SpannableStringBuilder;

    iget v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->savedImgStartPos:I

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    .line 2549
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->savedImgAttributesForNextChar:Lorg/xml/sax/Attributes;

    const/4 v1, 0x1

    const-string v2, "img"

    invoke-direct {p0, v2, v0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->startImg(Ljava/lang/String;Lorg/xml/sax/Attributes;Z)V

    return-void
.end method

.method private removeFloatInSameLine(Landroid/text/SpannableStringBuilder;)Z
    .locals 9

    .line 2019
    const-class v0, Lcom/flyersoft/staticlayout/MyFloatSpan;

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getLast(Landroid/text/Spanned;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 2022
    :cond_0
    invoke-virtual {p1, v0}, Landroid/text/SpannableStringBuilder;->getSpanStart(Ljava/lang/Object;)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_1

    return v1

    .line 2027
    :cond_1
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v4

    const/4 v5, 0x1

    sub-int/2addr v4, v5

    :goto_0
    const/16 v6, 0xa

    if-lez v4, :cond_2

    .line 2028
    invoke-virtual {p1, v4}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v7

    if-ne v7, v6, :cond_2

    add-int/lit8 v4, v4, -0x1

    goto :goto_0

    :cond_2
    add-int/lit8 v7, v2, 0x1

    :goto_1
    if-ge v7, v4, :cond_4

    .line 2031
    invoke-virtual {p1, v7}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v8

    if-ne v8, v6, :cond_3

    goto :goto_2

    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    :cond_4
    const/4 v1, 0x1

    :goto_2
    if-eqz v1, :cond_6

    .line 2037
    iget-object v4, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->deletedFloatContent:Ljava/lang/CharSequence;

    if-eqz v4, :cond_5

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    const v5, 0xfffc

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    if-ne v4, v3, :cond_6

    .line 2038
    :cond_5
    invoke-virtual {p1, v0}, Landroid/text/SpannableStringBuilder;->removeSpan(Ljava/lang/Object;)V

    .line 2039
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->deletedFloatContent:Ljava/lang/CharSequence;

    if-eqz v0, :cond_6

    .line 2040
    invoke-virtual {p1, v2, v0}, Landroid/text/SpannableStringBuilder;->insert(ILjava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    :cond_6
    return v1
.end method

.method private removeTagCache()V
    .locals 2

    .line 997
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tags:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 998
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tags:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 999
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->classes:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1000
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->cssStyles:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method private savedImgAttributesForNextChar(Ljava/lang/String;Lorg/xml/sax/Attributes;Lcom/flyersoft/components/CSS$Style;)V
    .locals 1

    .line 2536
    const-string v0, "img"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 2537
    iput-object p2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->savedImgAttributesForNextChar:Lorg/xml/sax/Attributes;

    .line 2538
    iget-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->spanBulder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p1

    iput p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->savedImgStartPos:I

    .line 2539
    iput-object p3, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->savedCssForNextChar:Lcom/flyersoft/components/CSS$Style;

    :cond_0
    return-void
.end method

.method private setAlignment(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Alignment;II)V
    .locals 5

    sub-int v0, p4, p3

    const v1, 0xfffc

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    .line 1733
    invoke-virtual {p1, p3}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v0

    if-ne v0, v1, :cond_0

    goto :goto_2

    :cond_0
    :goto_0
    const/16 v0, 0xa

    if-ge p3, p4, :cond_1

    .line 1735
    invoke-virtual {p1, p3}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v3

    if-ne v3, v0, :cond_1

    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    :cond_1
    if-le p3, v2, :cond_2

    add-int/lit8 v3, p3, -0x1

    .line 1737
    invoke-virtual {p1, v3}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v4

    if-eq v4, v0, :cond_2

    .line 1738
    invoke-virtual {p1, v3}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v3

    if-ne v3, v1, :cond_2

    add-int/lit8 v1, p3, -0x2

    invoke-virtual {p1, v1}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v1

    if-ne v1, v0, :cond_2

    add-int/lit8 p3, p3, -0x1

    :cond_2
    move v1, p3

    :goto_1
    if-ge v1, p4, :cond_5

    .line 1743
    invoke-virtual {p1, v1}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lcom/flyersoft/tools/A;->isEmptyChar(C)Z

    move-result v3

    if-nez v3, :cond_4

    sub-int/2addr p4, v2

    .line 1749
    invoke-virtual {p1, p4}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result p4

    if-eq p4, v0, :cond_3

    .line 1750
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBr2(Landroid/text/SpannableStringBuilder;)V

    .line 1751
    :cond_3
    iget p2, p2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Alignment;->align:I

    .line 1752
    new-instance p4, Lcom/flyersoft/staticlayout/AlignmentSpan$Standard;

    invoke-static {p2}, Lcom/flyersoft/staticlayout/MRTextView;->getAlignment(I)Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    move-result-object p2

    invoke-direct {p4, p2}, Lcom/flyersoft/staticlayout/AlignmentSpan$Standard;-><init>(Lcom/flyersoft/staticlayout/MyLayout$Alignment;)V

    .line 1753
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p2

    invoke-direct {p0, p1, p4, p3, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    return-void

    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_5
    :goto_2
    return-void
.end method

.method private setBionic(Landroid/text/SpannableStringBuilder;Ljava/lang/String;)V
    .locals 12

    .line 3076
    sget-boolean v0, Lcom/flyersoft/tools/A;->bionic:Z

    if-nez v0, :cond_0

    goto :goto_4

    .line 3078
    :cond_0
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v0, v1

    .line 3080
    const-string v1, " |-|\u2014"

    invoke-virtual {p2, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p2

    .line 3081
    array-length v1, p2

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_5

    aget-object v4, p2, v3

    .line 3083
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_1
    const/4 v8, 0x2

    const/4 v9, 0x1

    if-ge v6, v5, :cond_1

    .line 3085
    invoke-virtual {v4, v6}, Ljava/lang/String;->charAt(I)C

    move-result v10

    invoke-static {v10}, Ljava/lang/Character;->getType(C)I

    move-result v10

    if-eq v10, v9, :cond_1

    if-eq v10, v8, :cond_1

    add-int/lit8 v7, v7, 0x1

    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v6, v5, -0x1

    const/4 v10, 0x0

    :goto_2
    if-le v6, v7, :cond_2

    .line 3092
    invoke-virtual {v4, v6}, Ljava/lang/String;->charAt(I)C

    move-result v11

    invoke-static {v11}, Ljava/lang/Character;->getType(C)I

    move-result v11

    if-eq v11, v9, :cond_2

    if-eq v11, v8, :cond_2

    add-int/lit8 v10, v10, 0x1

    add-int/lit8 v6, v6, -0x1

    goto :goto_2

    :cond_2
    sub-int/2addr v5, v7

    sub-int/2addr v5, v10

    if-lez v5, :cond_4

    const/4 v4, 0x3

    if-gt v5, v4, :cond_3

    const/4 v4, 0x1

    goto :goto_3

    :cond_3
    int-to-float v4, v5

    const/high16 v6, 0x40000000    # 2.0f

    div-float/2addr v4, v6

    .line 3104
    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    .line 3105
    :goto_3
    new-instance v6, Lcom/flyersoft/staticlayout/MyStyleSpan;

    invoke-direct {v6, v9}, Lcom/flyersoft/staticlayout/MyStyleSpan;-><init>(I)V

    add-int v8, v0, v7

    add-int/2addr v4, v8

    invoke-direct {p0, p1, v6, v8, v4}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    :cond_4
    add-int/2addr v5, v7

    add-int/2addr v5, v10

    add-int/2addr v5, v9

    add-int/2addr v0, v5

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_5
    :goto_4
    return-void
.end method

.method private setFloatQuote(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FloatQuote;II)Z
    .locals 25

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v7, p3

    move/from16 v8, p4

    .line 1816
    invoke-direct/range {p0 .. p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->removeFloatInSameLine(Landroid/text/SpannableStringBuilder;)Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_0

    return v4

    :cond_0
    move v3, v7

    :goto_0
    const/4 v5, -0x1

    if-ge v3, v8, :cond_2

    .line 1821
    invoke-virtual {v1, v3}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v6

    invoke-static {v6}, Lcom/flyersoft/tools/A;->isEmptyChar(C)Z

    move-result v6

    if-nez v6, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    const/4 v3, -0x1

    :goto_1
    if-ne v3, v5, :cond_3

    return v4

    :cond_3
    add-int/lit8 v5, v3, 0x1

    move v6, v5

    :goto_2
    const v9, 0xfffc

    if-ge v6, v8, :cond_5

    .line 1829
    invoke-virtual {v1, v6}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v10

    if-ne v10, v9, :cond_4

    return v4

    :cond_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 1832
    :cond_5
    invoke-virtual {v1, v3}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v10

    const/4 v11, 0x1

    if-eq v10, v9, :cond_6

    const/4 v9, 0x1

    goto :goto_3

    :cond_6
    const/4 v9, 0x0

    :goto_3
    add-int/lit8 v6, v8, -0x1

    :goto_4
    if-le v6, v3, :cond_8

    .line 1837
    invoke-virtual {v1, v6}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v12

    invoke-static {v12}, Lcom/flyersoft/tools/A;->isEmptyChar(C)Z

    move-result v12

    if-nez v12, :cond_7

    goto :goto_5

    :cond_7
    add-int/lit8 v6, v6, -0x1

    goto :goto_4

    :cond_8
    :goto_5
    if-ge v5, v6, :cond_a

    .line 1842
    invoke-virtual {v1, v5}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lcom/flyersoft/tools/A;->isEmptyChar(C)Z

    move-result v3

    if-nez v3, :cond_9

    goto :goto_6

    :cond_9
    add-int/lit8 v5, v5, 0x1

    goto :goto_5

    .line 1845
    :cond_a
    :goto_6
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v12, ""

    invoke-direct {v3, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    if-eqz v9, :cond_c

    if-le v6, v5, :cond_b

    return v4

    :cond_b
    if-ne v6, v5, :cond_c

    .line 1850
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v3

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :cond_c
    move-object v13, v3

    .line 1853
    new-instance v14, Lcom/flyersoft/staticlayout/MyFloatSpan;

    invoke-direct {v14}, Lcom/flyersoft/staticlayout/MyFloatSpan;-><init>()V

    .line 1854
    iget-object v15, v2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FloatQuote;->tag:Ljava/lang/String;

    .line 1855
    iget-object v3, v2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FloatQuote;->style:Lcom/flyersoft/components/CSS$Style;

    if-nez v9, :cond_d

    if-lt v6, v5, :cond_d

    add-int/2addr v6, v11

    .line 1860
    invoke-virtual {v1, v5, v6}, Landroid/text/SpannableStringBuilder;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v5

    iput-object v5, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_text:Ljava/lang/CharSequence;

    .line 1863
    :cond_d
    iget-object v5, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    iget-object v6, v3, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    invoke-static {v6, v4}, Lcom/flyersoft/components/CSS;->getPadding(Landroid/graphics/RectF;I)F

    move-result v6

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v16

    mul-float v6, v6, v16

    iput v6, v5, Landroid/graphics/RectF;->left:F

    .line 1864
    iget-object v5, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    iget-object v6, v3, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    invoke-static {v6, v11}, Lcom/flyersoft/components/CSS;->getPadding(Landroid/graphics/RectF;I)F

    move-result v6

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v16

    mul-float v6, v6, v16

    iput v6, v5, Landroid/graphics/RectF;->top:F

    .line 1865
    iget-object v5, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    iget-object v6, v3, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    const/4 v11, 0x2

    invoke-static {v6, v11}, Lcom/flyersoft/components/CSS;->getPadding(Landroid/graphics/RectF;I)F

    move-result v6

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v17

    mul-float v6, v6, v17

    iput v6, v5, Landroid/graphics/RectF;->right:F

    .line 1866
    iget-object v5, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    iget-object v6, v3, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    const/4 v11, 0x3

    invoke-static {v6, v11}, Lcom/flyersoft/components/CSS;->getPadding(Landroid/graphics/RectF;I)F

    move-result v6

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v18

    mul-float v6, v6, v18

    iput v6, v5, Landroid/graphics/RectF;->bottom:F

    const/high16 v18, 0x40000000    # 2.0f

    if-eqz v9, :cond_13

    if-lez v7, :cond_e

    add-int/lit8 v2, v7, -0x1

    .line 1869
    invoke-virtual {v1, v2}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v2

    const/16 v5, 0xa

    if-eq v2, v5, :cond_e

    return v4

    .line 1872
    :cond_e
    const-class v2, Landroid/text/style/CharacterStyle;

    invoke-virtual {v1, v7, v8, v2}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v2

    move-object v4, v2

    check-cast v4, [Landroid/text/style/CharacterStyle;

    move-object v2, v3

    .line 1873
    new-instance v3, Landroid/text/TextPaint;

    sget-object v5, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v5}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v5

    invoke-direct {v3, v5}, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V

    .line 1874
    sget-object v5, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v5}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v5

    move-object v6, v2

    move-object v2, v5

    const/4 v5, 0x0

    move-object v11, v6

    const/4 v6, 0x0

    invoke-static/range {v1 .. v6}, Lcom/flyersoft/staticlayout/Styled;->getReplacementAndUpdateState(Landroid/text/Spanned;Landroid/text/TextPaint;Landroid/text/TextPaint;[Landroid/text/style/CharacterStyle;ZZ)Lcom/flyersoft/staticlayout/ReplacementSpan;

    .line 1875
    invoke-virtual {v3}, Landroid/text/TextPaint;->getTextSize()F

    move-result v2

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v4

    div-float/2addr v2, v4

    cmpg-float v2, v2, v18

    if-gez v2, :cond_f

    .line 1876
    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v2

    mul-float v2, v2, v18

    invoke-virtual {v3, v2}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 1878
    :cond_f
    new-instance v2, Landroid/graphics/Paint$FontMetricsInt;

    invoke-direct {v2}, Landroid/graphics/Paint$FontMetricsInt;-><init>()V

    .line 1879
    invoke-virtual {v3, v2}, Landroid/text/TextPaint;->getFontMetricsInt(Landroid/graphics/Paint$FontMetricsInt;)I

    .line 1880
    invoke-static {v10}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v4

    if-eqz v4, :cond_10

    .line 1881
    iget v4, v2, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    neg-int v4, v4

    iget v5, v2, Landroid/graphics/Paint$FontMetricsInt;->top:I

    iget v2, v2, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    sub-int/2addr v5, v2

    add-int/2addr v4, v5

    int-to-float v2, v4

    iput v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_height:F

    goto :goto_7

    .line 1883
    :cond_10
    iget v4, v2, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    neg-int v4, v4

    iget v5, v2, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    add-int/2addr v4, v5

    iget v5, v2, Landroid/graphics/Paint$FontMetricsInt;->top:I

    iget v2, v2, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    sub-int/2addr v5, v2

    add-int/2addr v4, v5

    int-to-float v2, v4

    iput v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_height:F

    .line 1884
    :goto_7
    invoke-static {v13, v3}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v2

    iput v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_width:F

    .line 1886
    iget v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_height:F

    iget-object v4, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    iget-object v5, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v4, v5

    add-float/2addr v2, v4

    iput v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_height:F

    .line 1887
    iget-object v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    iget-object v4, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    add-float/2addr v2, v4

    invoke-static/range {v18 .. v18}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v4

    cmpg-float v2, v2, v4

    if-gez v2, :cond_11

    .line 1888
    iget-object v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    invoke-static/range {v18 .. v18}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v4

    iput v4, v2, Landroid/graphics/RectF;->right:F

    .line 1889
    :cond_11
    iget-object v2, v11, Lcom/flyersoft/components/CSS$Style;->indent:Ljava/lang/Float;

    if-eqz v2, :cond_12

    .line 1890
    iget-object v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    iget v4, v2, Landroid/graphics/RectF;->left:F

    iget-object v5, v11, Lcom/flyersoft/components/CSS$Style;->indent:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM2()F

    move-result v6

    mul-float v5, v5, v6

    add-float/2addr v4, v5

    iput v4, v2, Landroid/graphics/RectF;->left:F

    .line 1891
    :cond_12
    iget v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_width:F

    iget-object v4, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    iget-object v5, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    add-float/2addr v4, v5

    add-float/2addr v2, v4

    iput v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_width:F

    const/4 v2, 0x1

    .line 1893
    iput-boolean v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->isDropcap:Z

    .line 1894
    iput-object v3, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->workPaint:Landroid/text/TextPaint;

    .line 1895
    iput-boolean v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->isLeft:Z

    .line 1896
    iput-boolean v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->noindent:Z

    move/from16 v18, v9

    move-object v6, v11

    move-object/from16 v23, v13

    const/4 v4, 0x2

    goto/16 :goto_11

    :cond_13
    move-object v6, v3

    .line 1899
    iget-object v3, v2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FloatQuote;->imageSpan:Lcom/flyersoft/staticlayout/MyImageSpan;

    if-nez v3, :cond_16

    .line 1900
    const-class v3, Lcom/flyersoft/staticlayout/MyImageSpan;

    invoke-direct {v0, v1, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getLast(Landroid/text/Spanned;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_14

    return v4

    .line 1903
    :cond_14
    invoke-virtual {v1, v3}, Landroid/text/SpannableStringBuilder;->getSpanStart(Ljava/lang/Object;)I

    move-result v5

    if-eq v5, v7, :cond_15

    return v4

    .line 1906
    :cond_15
    check-cast v3, Lcom/flyersoft/staticlayout/MyImageSpan;

    iput-object v3, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->imageSpan:Lcom/flyersoft/staticlayout/MyImageSpan;

    .line 1907
    iget-object v3, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->imageSpan:Lcom/flyersoft/staticlayout/MyImageSpan;

    const/4 v5, 0x1

    iput-boolean v5, v3, Lcom/flyersoft/staticlayout/MyImageSpan;->originalSize:Z

    goto :goto_8

    .line 1909
    :cond_16
    iget-object v3, v2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FloatQuote;->imageSpan:Lcom/flyersoft/staticlayout/MyImageSpan;

    iput-object v3, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->imageSpan:Lcom/flyersoft/staticlayout/MyImageSpan;

    .line 1911
    :goto_8
    const-string v3, "100%"

    iget-object v5, v6, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_17

    return v4

    .line 1914
    :cond_17
    iget-object v3, v6, Lcom/flyersoft/components/CSS$Style;->floatSp:Ljava/lang/String;

    const-string v5, "left"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    iput-boolean v3, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->isLeft:Z

    .line 1915
    invoke-static {}, Lcom/flyersoft/tools/A;->getPageWidth()I

    move-result v3

    int-to-float v3, v3

    .line 1916
    iget-object v5, v6, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    invoke-static {v5}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v5

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v19

    mul-float v5, v5, v19

    const/4 v11, 0x0

    cmpl-float v20, v5, v11

    if-nez v20, :cond_18

    const/16 v20, 0x0

    .line 1918
    iget-object v11, v2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FloatQuote;->attributes:Lorg/xml/sax/Attributes;

    if-eqz v11, :cond_19

    .line 1919
    iget-object v11, v2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FloatQuote;->attributes:Lorg/xml/sax/Attributes;

    const-string v4, "width"

    invoke-interface {v11, v4}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_19

    .line 1923
    :try_start_0
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    int-to-float v5, v5

    invoke-static {v5}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    int-to-float v5, v4

    goto :goto_9

    .line 1925
    :catch_0
    invoke-static {v4}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v4

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v5

    mul-float v5, v5, v4

    goto :goto_9

    :cond_18
    const/16 v20, 0x0

    :cond_19
    :goto_9
    cmpl-float v4, v5, v20

    if-nez v4, :cond_1a

    .line 1930
    const-string v11, "auto"

    move/from16 v22, v3

    iget-object v3, v6, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    invoke-virtual {v11, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1b

    iget-object v2, v2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FloatQuote;->imageSpan:Lcom/flyersoft/staticlayout/MyImageSpan;

    if-nez v2, :cond_1b

    .line 1931
    iget-object v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->imageSpan:Lcom/flyersoft/staticlayout/MyImageSpan;

    const/4 v3, 0x0

    iput-object v3, v2, Lcom/flyersoft/staticlayout/MyImageSpan;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 1932
    iget-object v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->imageSpan:Lcom/flyersoft/staticlayout/MyImageSpan;

    invoke-virtual {v2}, Lcom/flyersoft/staticlayout/MyImageSpan;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v2, :cond_1b

    .line 1933
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v3

    if-lez v3, :cond_1b

    .line 1934
    iget-object v3, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->imageSpan:Lcom/flyersoft/staticlayout/MyImageSpan;

    new-instance v11, Landroid/graphics/Rect;

    move-object/from16 p2, v2

    invoke-virtual/range {p2 .. p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    move/from16 v23, v4

    invoke-virtual/range {p2 .. p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v4

    move/from16 v24, v5

    const/4 v5, 0x0

    invoke-direct {v11, v5, v5, v2, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v11, v3, Lcom/flyersoft/staticlayout/MyImageSpan;->mRect:Landroid/graphics/Rect;

    goto :goto_a

    :cond_1a
    move/from16 v22, v3

    :cond_1b
    move/from16 v23, v4

    move/from16 v24, v5

    .line 1936
    :goto_a
    iget-object v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->imageSpan:Lcom/flyersoft/staticlayout/MyImageSpan;

    iget-object v2, v2, Lcom/flyersoft/staticlayout/MyImageSpan;->mRect:Landroid/graphics/Rect;

    if-eqz v2, :cond_1c

    .line 1937
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v3

    if-nez v3, :cond_1e

    .line 1938
    :cond_1c
    iget-object v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->imageSpan:Lcom/flyersoft/staticlayout/MyImageSpan;

    invoke-virtual {v2}, Lcom/flyersoft/staticlayout/MyImageSpan;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v2, :cond_30

    .line 1939
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v3

    if-gtz v3, :cond_1d

    goto/16 :goto_14

    .line 1941
    :cond_1d
    iget-object v3, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->imageSpan:Lcom/flyersoft/staticlayout/MyImageSpan;

    new-instance v4, Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v5

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    const/4 v11, 0x0

    invoke-direct {v4, v11, v11, v5, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v4, v3, Lcom/flyersoft/staticlayout/MyImageSpan;->mRect:Landroid/graphics/Rect;

    move-object v2, v4

    :cond_1e
    if-nez v23, :cond_1f

    const/4 v3, 0x1

    goto :goto_b

    :cond_1f
    const/4 v3, 0x0

    :goto_b
    if-nez v23, :cond_20

    .line 1946
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v4

    int-to-float v5, v4

    goto :goto_c

    :cond_20
    move/from16 v5, v24

    .line 1947
    :goto_c
    iget-object v4, v6, Lcom/flyersoft/components/CSS$Style;->maxWidth:Ljava/lang/String;

    invoke-static {v4}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v4

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v11

    mul-float v4, v4, v11

    const v11, 0x3f866666    # 1.05f

    mul-float v4, v4, v11

    cmpl-float v11, v4, v20

    if-lez v11, :cond_21

    cmpl-float v11, v5, v4

    if-lez v11, :cond_21

    move v5, v4

    :cond_21
    const/high16 v4, 0x40800000    # 4.0f

    if-eqz v3, :cond_22

    div-float v3, v22, v18

    cmpl-float v11, v5, v3

    if-lez v11, :cond_22

    :goto_d
    move v5, v3

    goto :goto_e

    :cond_22
    const/high16 v3, 0x41200000    # 10.0f

    cmpl-float v11, v5, v20

    if-nez v11, :cond_23

    mul-float v5, v22, v4

    div-float/2addr v5, v3

    goto :goto_e

    :cond_23
    mul-float v11, v22, v18

    const/high16 v18, 0x40400000    # 3.0f

    div-float v11, v11, v18

    cmpl-float v18, v5, v11

    if-lez v18, :cond_24

    move v5, v11

    goto :goto_e

    :cond_24
    div-float v3, v22, v3

    cmpg-float v11, v5, v3

    if-gez v11, :cond_25

    goto :goto_d

    .line 1960
    :cond_25
    :goto_e
    iget-object v3, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_text:Ljava/lang/CharSequence;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_27

    .line 1961
    invoke-direct/range {p0 .. p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getLastAlignValue(Landroid/text/SpannableStringBuilder;)I

    move-result v3

    const/4 v11, 0x3

    if-ne v3, v11, :cond_26

    .line 1962
    sget-object v3, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    goto :goto_f

    :cond_26
    sget-object v3, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    .line 1964
    :goto_f
    iget-object v11, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_text:Ljava/lang/CharSequence;

    const/high16 p2, 0x40800000    # 4.0f

    iget-object v4, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_text:Ljava/lang/CharSequence;

    .line 1965
    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v4

    sget-object v18, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    move-object/from16 v22, v2

    invoke-virtual/range {v18 .. v18}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v2

    move/from16 v18, v9

    float-to-int v9, v5

    move-object/from16 v23, v13

    const/4 v13, 0x0

    invoke-static {v11, v13, v4, v2, v9}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/CharSequence;IILandroid/text/TextPaint;I)Landroid/text/StaticLayout$Builder;

    move-result-object v2

    .line 1966
    invoke-static {v2, v3}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;Landroid/text/Layout$Alignment;)Landroid/text/StaticLayout$Builder;

    move-result-object v2

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    .line 1967
    invoke-static {v2, v4, v3}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;FF)Landroid/text/StaticLayout$Builder;

    move-result-object v2

    .line 1968
    invoke-static {v2, v13}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;Z)Landroid/text/StaticLayout$Builder;

    move-result-object v2

    .line 1969
    invoke-static {v2}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;)Landroid/text/StaticLayout;

    move-result-object v2

    iput-object v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_sl:Landroid/text/StaticLayout;

    int-to-float v2, v9

    .line 1970
    iput v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_tv_w:F

    .line 1971
    iget-object v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_sl:Landroid/text/StaticLayout;

    iget-object v3, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_sl:Landroid/text/StaticLayout;

    invoke-virtual {v3}, Landroid/text/StaticLayout;->getLineCount()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/text/StaticLayout;->getLineTop(I)I

    move-result v2

    invoke-static/range {p2 .. p2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    add-int/2addr v2, v3

    int-to-float v2, v2

    iput v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_tv_h:F

    goto :goto_10

    :cond_27
    move-object/from16 v22, v2

    move/from16 v18, v9

    move-object/from16 v23, v13

    const/high16 p2, 0x40800000    # 4.0f

    .line 1974
    :goto_10
    iput v5, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_width:F

    .line 1975
    invoke-virtual/range {v22 .. v22}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    mul-float v5, v5, v2

    invoke-virtual/range {v22 .. v22}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v5, v2

    iget v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_tv_h:F

    add-float/2addr v5, v2

    iput v5, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_height:F

    .line 1977
    iget-object v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->margin:Landroid/graphics/RectF;

    iget-object v3, v6, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    const/4 v11, 0x0

    invoke-static {v3, v11}, Lcom/flyersoft/components/CSS;->getPadding(Landroid/graphics/RectF;I)F

    move-result v3

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v4

    mul-float v3, v3, v4

    iput v3, v2, Landroid/graphics/RectF;->left:F

    .line 1978
    iget-object v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->margin:Landroid/graphics/RectF;

    iget-object v3, v6, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    const/4 v5, 0x1

    invoke-static {v3, v5}, Lcom/flyersoft/components/CSS;->getPadding(Landroid/graphics/RectF;I)F

    move-result v3

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v4

    mul-float v3, v3, v4

    iput v3, v2, Landroid/graphics/RectF;->top:F

    .line 1979
    iget-object v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->margin:Landroid/graphics/RectF;

    iget-object v3, v6, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    const/4 v4, 0x2

    invoke-static {v3, v4}, Lcom/flyersoft/components/CSS;->getPadding(Landroid/graphics/RectF;I)F

    move-result v3

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v5

    mul-float v3, v3, v5

    iput v3, v2, Landroid/graphics/RectF;->right:F

    .line 1980
    iget-object v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->margin:Landroid/graphics/RectF;

    iget-object v3, v6, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    const/4 v11, 0x3

    invoke-static {v3, v11}, Lcom/flyersoft/components/CSS;->getPadding(Landroid/graphics/RectF;I)F

    move-result v3

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v5

    mul-float v3, v3, v5

    iput v3, v2, Landroid/graphics/RectF;->bottom:F

    .line 1981
    iget-object v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->margin:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    const/4 v3, 0x0

    cmpg-float v2, v2, v3

    if-gez v2, :cond_28

    .line 1982
    iget-object v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->margin:Landroid/graphics/RectF;

    iput v3, v2, Landroid/graphics/RectF;->left:F

    .line 1983
    :cond_28
    iget-object v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->margin:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->right:F

    cmpg-float v2, v2, v3

    if-gez v2, :cond_29

    .line 1984
    iget-object v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->margin:Landroid/graphics/RectF;

    iput v3, v2, Landroid/graphics/RectF;->right:F

    .line 1986
    :cond_29
    iget-object v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    iget-object v3, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->margin:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->top:F

    add-float/2addr v2, v3

    invoke-static/range {p2 .. p2}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v3

    cmpg-float v2, v2, v3

    if-gez v2, :cond_2a

    .line 1987
    iget-object v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    invoke-static/range {p2 .. p2}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v3

    iput v3, v2, Landroid/graphics/RectF;->top:F

    .line 1988
    :cond_2a
    iget-object v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    iget-object v3, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->margin:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v2, v3

    invoke-static/range {p2 .. p2}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v3

    cmpg-float v2, v2, v3

    if-gez v2, :cond_2b

    .line 1989
    iget-object v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    invoke-static/range {p2 .. p2}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v3

    iput v3, v2, Landroid/graphics/RectF;->bottom:F

    .line 1990
    :cond_2b
    iget v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_height:F

    iget-object v3, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->top:F

    iget-object v5, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v3, v5

    iget-object v5, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->margin:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->top:F

    add-float/2addr v3, v5

    iget-object v5, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->margin:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v3, v5

    add-float/2addr v2, v3

    iput v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_height:F

    .line 1992
    iget-object v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    iget-object v3, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->margin:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->left:F

    add-float/2addr v2, v3

    invoke-static/range {p2 .. p2}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v3

    cmpg-float v2, v2, v3

    if-gez v2, :cond_2c

    .line 1993
    iget-object v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    invoke-static/range {p2 .. p2}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v3

    iput v3, v2, Landroid/graphics/RectF;->left:F

    .line 1994
    :cond_2c
    iget-object v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->right:F

    iget-object v3, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->margin:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    add-float/2addr v2, v3

    invoke-static/range {p2 .. p2}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v3

    cmpg-float v2, v2, v3

    if-gez v2, :cond_2d

    .line 1995
    iget-object v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    invoke-static/range {p2 .. p2}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v3

    iput v3, v2, Landroid/graphics/RectF;->right:F

    .line 1996
    :cond_2d
    iget v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_width:F

    iget-object v3, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->left:F

    iget-object v5, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    add-float/2addr v3, v5

    iget-object v5, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->margin:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->left:F

    add-float/2addr v3, v5

    iget-object v5, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->margin:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    add-float/2addr v3, v5

    add-float/2addr v2, v3

    iput v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_width:F

    .line 2001
    :goto_11
    invoke-virtual {v1, v7, v8}, Landroid/text/SpannableStringBuilder;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v2

    iput-object v2, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->deletedFloatContent:Ljava/lang/CharSequence;

    .line 2002
    invoke-virtual {v1, v7, v8}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    .line 2003
    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    if-eqz v18, :cond_2e

    move-object/from16 v13, v23

    goto :goto_12

    .line 2004
    :cond_2e
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    :goto_12
    invoke-virtual {v1, v13}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 2005
    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    .line 2006
    new-instance v5, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;

    const v7, 0x3a83126f    # 0.001f

    invoke-direct {v5, v7}, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;-><init>(F)V

    invoke-direct {v0, v1, v5, v2, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 2008
    iput-object v15, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->tag:Ljava/lang/String;

    .line 2009
    iput-object v6, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    .line 2010
    iput v2, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->spStart:I

    .line 2011
    iput v3, v14, Lcom/flyersoft/staticlayout/MyFloatSpan;->spEnd:I

    .line 2012
    invoke-direct {v0, v1, v14, v2, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    if-eqz v18, :cond_2f

    const/4 v11, 0x2

    goto :goto_13

    :cond_2f
    const/4 v11, 0x1

    .line 2013
    :goto_13
    iput v11, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->floatSpanType:I

    const/16 v16, 0x1

    return v16

    :cond_30
    :goto_14
    const/16 v21, 0x0

    return v21
.end method

.method private setFontQuote(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FontQuote;II)V
    .locals 8

    .line 2083
    iget-object v0, p2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FontQuote;->tag:Ljava/lang/String;

    const-string v1, "strong"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2084
    iget-object v0, p2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FontQuote;->style:Lcom/flyersoft/components/CSS$Style;

    if-nez v0, :cond_0

    .line 2085
    new-instance v0, Lcom/flyersoft/components/CSS$Style;

    invoke-direct {v0}, Lcom/flyersoft/components/CSS$Style;-><init>()V

    iput-object v0, p2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FontQuote;->style:Lcom/flyersoft/components/CSS$Style;

    .line 2086
    :cond_0
    iget-object v0, p2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FontQuote;->style:Lcom/flyersoft/components/CSS$Style;

    iget-object v0, v0, Lcom/flyersoft/components/CSS$Style;->fontWeight:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/components/CSS;->isFontWeightLight(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 2087
    iget-object v0, p2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FontQuote;->style:Lcom/flyersoft/components/CSS$Style;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/flyersoft/components/CSS$Style;->bold:Z

    .line 2089
    :cond_1
    iget-object v6, p2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FontQuote;->style:Lcom/flyersoft/components/CSS$Style;

    const/4 v7, 0x1

    move-object v2, p0

    move-object v3, p1

    move v4, p3

    move v5, p4

    invoke-direct/range {v2 .. v7}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setFontStyles(Landroid/text/SpannableStringBuilder;IILcom/flyersoft/components/CSS$Style;Z)V

    return-void
.end method

.method private setFontStyles(Landroid/text/SpannableStringBuilder;IILcom/flyersoft/components/CSS$Style;Z)V
    .locals 2

    if-eqz p4, :cond_b

    if-ne p2, p3, :cond_0

    goto/16 :goto_1

    .line 2095
    :cond_0
    iget-boolean v0, p4, Lcom/flyersoft/components/CSS$Style;->bold:Z

    if-eqz v0, :cond_1

    .line 2096
    new-instance v0, Lcom/flyersoft/staticlayout/MyStyleSpan;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/flyersoft/staticlayout/MyStyleSpan;-><init>(I)V

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto :goto_0

    .line 2097
    :cond_1
    iget-object v0, p4, Lcom/flyersoft/components/CSS$Style;->fontWeight:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/components/CSS;->isFontWeightLight(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2098
    new-instance v0, Lcom/flyersoft/staticlayout/MyFontLightSpan;

    invoke-direct {v0}, Lcom/flyersoft/staticlayout/MyFontLightSpan;-><init>()V

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 2100
    :cond_2
    :goto_0
    iget-boolean v0, p4, Lcom/flyersoft/components/CSS$Style;->italic:Z

    if-eqz v0, :cond_3

    .line 2101
    new-instance v0, Lcom/flyersoft/staticlayout/MyStyleSpan;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lcom/flyersoft/staticlayout/MyStyleSpan;-><init>(I)V

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 2103
    :cond_3
    iget-boolean v0, p4, Lcom/flyersoft/components/CSS$Style;->underline:Z

    if-eqz v0, :cond_4

    .line 2104
    new-instance v0, Landroid/text/style/UnderlineSpan;

    invoke-direct {v0}, Landroid/text/style/UnderlineSpan;-><init>()V

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 2106
    :cond_4
    iget-boolean v0, p4, Lcom/flyersoft/components/CSS$Style;->strikethrough:Z

    if-eqz v0, :cond_5

    .line 2107
    new-instance v0, Landroid/text/style/StrikethroughSpan;

    invoke-direct {v0}, Landroid/text/style/StrikethroughSpan;-><init>()V

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 2109
    :cond_5
    iget-object v0, p4, Lcom/flyersoft/components/CSS$Style;->shadow:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 2110
    new-instance v0, Lcom/flyersoft/staticlayout/MyShadowSpan;

    iget-object v1, p4, Lcom/flyersoft/components/CSS$Style;->shadow:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/flyersoft/staticlayout/MyShadowSpan;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 2112
    :cond_6
    iget-object v0, p4, Lcom/flyersoft/components/CSS$Style;->color:Ljava/lang/String;

    if-eqz v0, :cond_8

    .line 2113
    iget-object v0, p4, Lcom/flyersoft/components/CSS$Style;->text_fill_color:Ljava/lang/String;

    if-nez v0, :cond_7

    const-class v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TextFillColor;

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getLast(Landroid/text/Spanned;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_8

    .line 2114
    :cond_7
    iget-object v0, p4, Lcom/flyersoft/components/CSS$Style;->color:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getHtmlColorInt(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_8

    const/high16 v1, -0x1000000

    if-eq v0, v1, :cond_8

    .line 2116
    new-instance v1, Landroid/text/style/ForegroundColorSpan;

    invoke-direct {v1, v0}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-direct {p0, p1, v1, p2, p3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 2119
    :cond_8
    iget-object v0, p4, Lcom/flyersoft/components/CSS$Style;->fontFace:Ljava/lang/String;

    if-eqz v0, :cond_9

    .line 2120
    iget-object v0, p4, Lcom/flyersoft/components/CSS$Style;->fontFace:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getTypefaceSpan(Ljava/lang/String;)Landroid/text/style/MetricAffectingSpan;

    move-result-object v0

    if-eqz v0, :cond_9

    .line 2122
    invoke-direct {p0, p1, v0, p2, p3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 2124
    :cond_9
    iget v0, p4, Lcom/flyersoft/components/CSS$Style;->fontSize:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_a

    .line 2125
    new-instance v0, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;

    iget v1, p4, Lcom/flyersoft/components/CSS$Style;->fontSize:F

    invoke-direct {v0, v1}, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;-><init>(F)V

    .line 2126
    iget-boolean v1, p4, Lcom/flyersoft/components/CSS$Style;->fontSizeInherited:Z

    iput-boolean v1, v0, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;->inherited:Z

    .line 2127
    invoke-direct {p0, p1, v0, p2, p3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    :cond_a
    if-eqz p5, :cond_b

    .line 2129
    iget-object p5, p4, Lcom/flyersoft/components/CSS$Style;->backgroundColor:Ljava/lang/String;

    if-eqz p5, :cond_b

    .line 2130
    iget-object p4, p4, Lcom/flyersoft/components/CSS$Style;->backgroundColor:Ljava/lang/String;

    invoke-static {p4}, Lcom/flyersoft/tools/T;->getHtmlColor(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p4

    if-eqz p4, :cond_b

    .line 2132
    new-instance p5, Lcom/flyersoft/components/CSS$BackgroundColorSpan;

    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    move-result p4

    invoke-direct {p5, p4}, Lcom/flyersoft/components/CSS$BackgroundColorSpan;-><init>(I)V

    invoke-direct {p0, p1, p5, p2, p3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    :cond_b
    :goto_1
    return-void
.end method

.method private setLiTag(Ljava/lang/String;Lcom/flyersoft/components/CSS$Style;)V
    .locals 1

    if-eqz p2, :cond_2

    .line 1050
    iget-object p1, p2, Lcom/flyersoft/components/CSS$Style;->ul_style:Ljava/lang/String;

    if-eqz p1, :cond_2

    .line 1051
    iget-object p1, p2, Lcom/flyersoft/components/CSS$Style;->ul_style:Ljava/lang/String;

    const-string v0, "none"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1052
    const-string p1, ""

    iput-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->li_tag:Ljava/lang/String;

    return-void

    .line 1053
    :cond_0
    iget-object p1, p2, Lcom/flyersoft/components/CSS$Style;->ul_style:Ljava/lang/String;

    const-string v0, "circle"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1054
    const-string p1, "\u25cb\u3000"

    iput-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->li_tag:Ljava/lang/String;

    return-void

    .line 1055
    :cond_1
    iget-object p1, p2, Lcom/flyersoft/components/CSS$Style;->ul_style:Ljava/lang/String;

    const-string p2, "square"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 1056
    const-string p1, "\u25a0\u3000"

    iput-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->li_tag:Ljava/lang/String;

    :cond_2
    return-void
.end method

.method private setMarginSpanProperty(Lcom/flyersoft/staticlayout/MyMarginSpan;Ljava/lang/String;Lcom/flyersoft/components/CSS$Style;II)V
    .locals 10

    .line 2184
    iput-object p3, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    .line 2185
    iput-object p2, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->tag:Ljava/lang/String;

    .line 2186
    iput p4, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->spStart:I

    .line 2187
    iput p5, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->spEnd:I

    .line 2188
    sget-boolean v0, Lcom/flyersoft/tools/A;->indentParagraph:Z

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 2189
    iget-object v0, p3, Lcom/flyersoft/components/CSS$Style;->indent:Ljava/lang/Float;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p3, Lcom/flyersoft/components/CSS$Style;->indent:Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    :goto_0
    iput v0, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->indent:F

    .line 2190
    :cond_1
    iget-boolean v0, p3, Lcom/flyersoft/components/CSS$Style;->noindent:Z

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    .line 2191
    iput-boolean v2, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->noindent:Z

    .line 2194
    :cond_2
    iget-object v0, p3, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    invoke-static {v0}, Lcom/flyersoft/components/CSS;->isMarginNull(Landroid/graphics/RectF;)Z

    move-result v0

    const/high16 v3, 0x3f800000    # 1.0f

    if-eqz v0, :cond_3

    iget-object v0, p3, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    invoke-static {v0}, Lcom/flyersoft/components/CSS;->isMarginNull(Landroid/graphics/RectF;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 2196
    :cond_3
    iget-object v0, p3, Lcom/flyersoft/components/CSS$Style;->marginInherited:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    cmpl-float v0, v0, v1

    if-gtz v0, :cond_4

    iget-object v0, p3, Lcom/flyersoft/components/CSS$Style;->marginInherited:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    cmpl-float v0, v0, v1

    if-gtz v0, :cond_4

    iget-object v0, p3, Lcom/flyersoft/components/CSS$Style;->paddingInherited:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    cmpl-float v0, v0, v1

    if-gtz v0, :cond_4

    iget-object v0, p3, Lcom/flyersoft/components/CSS$Style;->paddingInherited:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_5

    .line 2198
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->spanBulder:Landroid/text/SpannableStringBuilder;

    const-class v4, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;

    invoke-virtual {v0, p4, p5, v4}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p4

    move-object v7, p4

    check-cast v7, [Landroid/text/style/CharacterStyle;

    .line 2199
    array-length p4, v7

    if-lez p4, :cond_5

    .line 2200
    new-instance v6, Landroid/text/TextPaint;

    sget-object p4, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p4}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object p4

    invoke-direct {v6, p4}, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V

    .line 2201
    iget-object v4, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->spanBulder:Landroid/text/SpannableStringBuilder;

    sget-object p4, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p4}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v5

    const/4 v8, 0x0

    const/4 v9, 0x1

    invoke-static/range {v4 .. v9}, Lcom/flyersoft/staticlayout/Styled;->getReplacementAndUpdateState(Landroid/text/Spanned;Landroid/text/TextPaint;Landroid/text/TextPaint;[Landroid/text/style/CharacterStyle;ZZ)Lcom/flyersoft/staticlayout/ReplacementSpan;

    .line 2202
    invoke-virtual {v6}, Landroid/text/TextPaint;->getTextSize()F

    move-result p4

    sget-object p5, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p5}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object p5

    invoke-virtual {p5}, Landroid/text/TextPaint;->getTextSize()F

    move-result p5

    div-float/2addr p4, p5

    goto :goto_1

    :cond_5
    const/high16 p4, 0x3f800000    # 1.0f

    .line 2206
    :goto_1
    iget-object p5, p3, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    const/4 v0, 0x0

    invoke-static {p5, v0}, Lcom/flyersoft/components/CSS;->getPadding(Landroid/graphics/RectF;I)F

    move-result p5

    iput p5, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->leftPadding:F

    .line 2207
    iget-object p5, p3, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    invoke-static {p5, p2, v0}, Lcom/flyersoft/components/CSS;->getMargin(Landroid/graphics/RectF;Ljava/lang/String;I)F

    move-result p5

    iget v4, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->leftPadding:F

    add-float/2addr p5, v4

    iget-object v4, p3, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    iget-object v5, p3, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    invoke-static {v4, v5, v0}, Lcom/flyersoft/components/CSS;->getBorder([Ljava/lang/String;Landroid/graphics/RectF;I)F

    move-result v0

    add-float/2addr p5, v0

    iput p5, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->leftMargin:F

    .line 2208
    iget-object p5, p3, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    invoke-static {p5, v2}, Lcom/flyersoft/components/CSS;->getPadding(Landroid/graphics/RectF;I)F

    move-result p5

    iget-object v0, p3, Lcom/flyersoft/components/CSS$Style;->paddingInherited:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_6

    move v0, p4

    goto :goto_2

    :cond_6
    const/high16 v0, 0x3f800000    # 1.0f

    :goto_2
    mul-float p5, p5, v0

    iput p5, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->topPadding:F

    .line 2209
    iget-object p5, p3, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    invoke-static {p5, p2, v2}, Lcom/flyersoft/components/CSS;->getMargin(Landroid/graphics/RectF;Ljava/lang/String;I)F

    move-result p5

    iget-object v0, p3, Lcom/flyersoft/components/CSS$Style;->marginInherited:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_7

    move v0, p4

    goto :goto_3

    :cond_7
    const/high16 v0, 0x3f800000    # 1.0f

    :goto_3
    mul-float p5, p5, v0

    iget v0, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->topPadding:F

    add-float/2addr p5, v0

    iget-object v0, p3, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    iget-object v4, p3, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    .line 2210
    invoke-static {v0, v4, v2}, Lcom/flyersoft/components/CSS;->getBorder([Ljava/lang/String;Landroid/graphics/RectF;I)F

    move-result v0

    add-float/2addr p5, v0

    iput p5, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->topMargin:F

    .line 2211
    iget-object p5, p3, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    const/4 v0, 0x2

    invoke-static {p5, v0}, Lcom/flyersoft/components/CSS;->getPadding(Landroid/graphics/RectF;I)F

    move-result p5

    iput p5, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->rightPadding:F

    .line 2212
    iget-object p5, p3, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    invoke-static {p5, p2, v0}, Lcom/flyersoft/components/CSS;->getMargin(Landroid/graphics/RectF;Ljava/lang/String;I)F

    move-result p5

    iget v2, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->rightPadding:F

    add-float/2addr p5, v2

    iget-object v2, p3, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    iget-object v4, p3, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    invoke-static {v2, v4, v0}, Lcom/flyersoft/components/CSS;->getBorder([Ljava/lang/String;Landroid/graphics/RectF;I)F

    move-result v0

    add-float/2addr p5, v0

    iput p5, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->rightMargin:F

    .line 2213
    iget-object p5, p3, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    const/4 v0, 0x3

    invoke-static {p5, v0}, Lcom/flyersoft/components/CSS;->getPadding(Landroid/graphics/RectF;I)F

    move-result p5

    iget-object v2, p3, Lcom/flyersoft/components/CSS$Style;->paddingInherited:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    cmpl-float v2, v2, v1

    if-lez v2, :cond_8

    move v2, p4

    goto :goto_4

    :cond_8
    const/high16 v2, 0x3f800000    # 1.0f

    :goto_4
    mul-float p5, p5, v2

    iput p5, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->bottomPadding:F

    .line 2214
    iget-object p5, p3, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    invoke-static {p5, p2, v0}, Lcom/flyersoft/components/CSS;->getMargin(Landroid/graphics/RectF;Ljava/lang/String;I)F

    move-result p2

    iget-object p5, p3, Lcom/flyersoft/components/CSS$Style;->marginInherited:Landroid/graphics/RectF;

    iget p5, p5, Landroid/graphics/RectF;->bottom:F

    cmpl-float p5, p5, v1

    if-lez p5, :cond_9

    move v3, p4

    :cond_9
    mul-float p2, p2, v3

    iget p4, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->bottomPadding:F

    add-float/2addr p2, p4

    iget-object p4, p3, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    iget-object p3, p3, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    .line 2215
    invoke-static {p4, p3, v0}, Lcom/flyersoft/components/CSS;->getBorder([Ljava/lang/String;Landroid/graphics/RectF;I)F

    move-result p3

    add-float/2addr p2, p3

    iput p2, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->bottomMargin:F

    .line 2228
    sget p2, Lcom/flyersoft/tools/A;->paragraphSpace:I

    const/16 p3, 0xa

    if-ne p2, p3, :cond_b

    sget-boolean p2, Lcom/flyersoft/tools/A;->trimBlankSpace:Z

    if-eqz p2, :cond_a

    goto :goto_5

    :cond_a
    return-void

    .line 2229
    :cond_b
    :goto_5
    invoke-static {}, Lcom/flyersoft/tools/A;->getParagraphRatio()F

    move-result p2

    .line 2230
    iget p3, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->topPadding:F

    mul-float p3, p3, p2

    iput p3, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->topPadding:F

    .line 2231
    iget p3, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->topMargin:F

    mul-float p3, p3, p2

    iput p3, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->topMargin:F

    .line 2232
    iget p3, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->bottomPadding:F

    mul-float p3, p3, p2

    iput p3, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->bottomPadding:F

    .line 2233
    iget p3, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->bottomMargin:F

    mul-float p3, p3, p2

    iput p3, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->bottomMargin:F

    return-void
.end method

.method private setPreQuote(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$PreQuote;II)V
    .locals 6

    .line 2072
    iget-object v3, p2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$PreQuote;->style:Lcom/flyersoft/components/CSS$Style;

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p3

    move-object v4, v3

    move v3, p4

    .line 2073
    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setFontStyles(Landroid/text/SpannableStringBuilder;IILcom/flyersoft/components/CSS$Style;Z)V

    .line 2074
    invoke-static {v4}, Lcom/flyersoft/components/CSS;->hasParagraphProperty(Lcom/flyersoft/components/CSS$Style;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 2075
    new-instance v1, Lcom/flyersoft/staticlayout/MyMarginSpan;

    const/4 p2, 0x0

    invoke-direct {v1, p2, p2, p2, p2}, Lcom/flyersoft/staticlayout/MyMarginSpan;-><init>(FFFF)V

    move v5, v3

    move-object v3, v4

    move v4, v2

    .line 2076
    const-string v2, "pre"

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setMarginSpanProperty(Lcom/flyersoft/staticlayout/MyMarginSpan;Ljava/lang/String;Lcom/flyersoft/components/CSS$Style;II)V

    move v2, v4

    move v3, v5

    .line 2077
    invoke-direct {p0, v1, p1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->deleteTopMarginIfPriorHas(Lcom/flyersoft/staticlayout/MyMarginSpan;Landroid/text/SpannableStringBuilder;I)V

    .line 2078
    invoke-direct {p0, p1, v1, v2, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    return-void

    :cond_0
    move-object v0, p0

    return-void
.end method

.method private setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V
    .locals 1

    if-ne p3, p4, :cond_0

    const/4 p1, 0x1

    .line 1763
    new-array p1, p1, [Ljava/lang/Object;

    const-string p2, "error setspan, where==len"

    const/4 p3, 0x0

    aput-object p2, p1, p3

    invoke-static {p1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    return-void

    :cond_0
    const/16 v0, 0x21

    .line 1766
    invoke-virtual {p1, p2, p3, p4, v0}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    return-void
.end method

.method private setSuperScriptSpan(Landroid/text/SpannableStringBuilder;IIF)V
    .locals 1

    .line 2742
    new-instance v0, Lcom/flyersoft/staticlayout/MySuperscriptSpan;

    invoke-direct {v0}, Lcom/flyersoft/staticlayout/MySuperscriptSpan;-><init>()V

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 2743
    new-instance v0, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;

    invoke-direct {v0, p4}, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;-><init>(F)V

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    return-void
.end method

.method private setTableQuote(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableQuote;II)V
    .locals 8

    .line 1770
    sget-boolean v0, Lcom/flyersoft/tools/A;->disableCSS:Z

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/flyersoft/tools/A;->cssOthers:Z

    if-eqz v0, :cond_0

    return-void

    .line 1772
    :cond_0
    iget-object v3, p2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableQuote;->tag:Ljava/lang/String;

    .line 1773
    new-instance v2, Lcom/flyersoft/staticlayout/MyMarginSpan;

    const/4 v0, 0x0

    invoke-direct {v2, v0, v0, v0, v0}, Lcom/flyersoft/staticlayout/MyMarginSpan;-><init>(FFFF)V

    .line 1774
    new-instance v4, Lcom/flyersoft/components/CSS$Style;

    invoke-direct {v4}, Lcom/flyersoft/components/CSS$Style;-><init>()V

    .line 1776
    iget-object v1, p2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableQuote;->style:Lcom/flyersoft/components/CSS$Style;

    if-eqz v1, :cond_1

    .line 1777
    iget-object v1, p2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableQuote;->style:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->backgroundColor:Ljava/lang/String;

    iput-object v1, v4, Lcom/flyersoft/components/CSS$Style;->backgroundColor:Ljava/lang/String;

    .line 1778
    :cond_1
    const-string v1, "table"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/high16 v5, 0x3d800000    # 0.0625f

    const-string v6, "solid"

    const-string v7, "#777777"

    if-eqz v1, :cond_3

    const/4 v0, 0x1

    .line 1779
    iput-boolean v0, v2, Lcom/flyersoft/staticlayout/MyMarginSpan;->isTable:Z

    .line 1780
    iget-object v1, p2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableQuote;->style:Lcom/flyersoft/components/CSS$Style;

    if-eqz v1, :cond_2

    .line 1781
    iget-object p2, p2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableQuote;->style:Lcom/flyersoft/components/CSS$Style;

    iget-object p2, p2, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    iput-object p2, v4, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    .line 1783
    :cond_2
    iget-object p2, v4, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    const/high16 v1, 0x3f000000    # 0.5f

    iput v1, p2, Landroid/graphics/RectF;->left:F

    .line 1784
    iget-object p2, v4, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    iput v1, p2, Landroid/graphics/RectF;->right:F

    .line 1785
    filled-new-array {v7, v7, v7, v7}, [Ljava/lang/String;

    move-result-object p2

    iput-object p2, v4, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    .line 1786
    filled-new-array {v6, v6, v6, v6}, [Ljava/lang/String;

    move-result-object p2

    iput-object p2, v4, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    .line 1787
    new-instance p2, Landroid/graphics/RectF;

    invoke-direct {p2, v5, v5, v5, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object p2, v4, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    .line 1789
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getLastAlignValue(Landroid/text/SpannableStringBuilder;)I

    move-result p2

    if-le p2, v0, :cond_4

    .line 1790
    new-instance p2, Lcom/flyersoft/staticlayout/AlignmentSpan$Standard;

    sget-object v0, Lcom/flyersoft/staticlayout/MyLayout$Alignment;->ALIGN_LEFT:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    invoke-direct {p2, v0}, Lcom/flyersoft/staticlayout/AlignmentSpan$Standard;-><init>(Lcom/flyersoft/staticlayout/MyLayout$Alignment;)V

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto :goto_0

    :cond_3
    const/4 p2, 0x0

    .line 1793
    filled-new-array {p2, v7, p2, p2}, [Ljava/lang/String;

    move-result-object v1

    iput-object v1, v4, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    .line 1794
    filled-new-array {p2, v6, p2, p2}, [Ljava/lang/String;

    move-result-object p2

    iput-object p2, v4, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    .line 1795
    new-instance p2, Landroid/graphics/RectF;

    invoke-direct {p2, v0, v5, v0, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object p2, v4, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    :cond_4
    :goto_0
    move-object v1, p0

    move v5, p3

    move v6, p4

    .line 1798
    invoke-direct/range {v1 .. v6}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setMarginSpanProperty(Lcom/flyersoft/staticlayout/MyMarginSpan;Ljava/lang/String;Lcom/flyersoft/components/CSS$Style;II)V

    .line 1799
    invoke-direct {p0, p1, v2, v5, v6}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    return-void
.end method

.method private setULQuote(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$ULQuote;II)V
    .locals 9

    .line 2048
    new-instance v1, Lcom/flyersoft/staticlayout/MyMarginSpan;

    iget v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->ul_level:I

    const/4 v2, 0x1

    if-lez v0, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    invoke-direct {v1, v0}, Lcom/flyersoft/staticlayout/MyMarginSpan;-><init>(I)V

    .line 2049
    iput-boolean v2, v1, Lcom/flyersoft/staticlayout/MyMarginSpan;->isULSpan:Z

    .line 2050
    iput p3, v1, Lcom/flyersoft/staticlayout/MyMarginSpan;->spStart:I

    .line 2051
    iput p4, v1, Lcom/flyersoft/staticlayout/MyMarginSpan;->spEnd:I

    .line 2053
    iget-object v7, p2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$ULQuote;->style:Lcom/flyersoft/components/CSS$Style;

    const/4 v8, 0x0

    move-object v3, p0

    move-object v4, p1

    move v5, p3

    move v6, p4

    invoke-direct/range {v3 .. v8}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setFontStyles(Landroid/text/SpannableStringBuilder;IILcom/flyersoft/components/CSS$Style;Z)V

    move v4, v5

    move v5, v6

    .line 2054
    iget-object p3, p2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$ULQuote;->style:Lcom/flyersoft/components/CSS$Style;

    if-eqz p3, :cond_2

    .line 2055
    iget p3, v1, Lcom/flyersoft/staticlayout/MyMarginSpan;->leftMargin:F

    .line 2056
    const-string v2, "ul"

    iget-object v3, p2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$ULQuote;->style:Lcom/flyersoft/components/CSS$Style;

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setMarginSpanProperty(Lcom/flyersoft/staticlayout/MyMarginSpan;Ljava/lang/String;Lcom/flyersoft/components/CSS$Style;II)V

    .line 2057
    iget p2, v1, Lcom/flyersoft/staticlayout/MyMarginSpan;->leftMargin:F

    cmpg-float p2, p2, p3

    if-gez p2, :cond_3

    .line 2058
    const-string p2, "li"

    const/4 p4, 0x0

    invoke-direct {p0, p2, p4}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getStyleFromAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Lcom/flyersoft/components/CSS$Style;

    move-result-object p2

    if-eqz p2, :cond_1

    .line 2059
    iget-object p4, p2, Lcom/flyersoft/components/CSS$Style;->ul_style:Ljava/lang/String;

    if-eqz p4, :cond_1

    iget-object p2, p2, Lcom/flyersoft/components/CSS$Style;->ul_style:Ljava/lang/String;

    const-string p4, "none"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 2060
    iget p2, v1, Lcom/flyersoft/staticlayout/MyMarginSpan;->leftMargin:F

    const/high16 p3, 0x3f800000    # 1.0f

    cmpg-float p2, p2, p3

    if-gez p2, :cond_3

    .line 2061
    iput p3, v1, Lcom/flyersoft/staticlayout/MyMarginSpan;->leftMargin:F

    goto :goto_1

    .line 2063
    :cond_1
    iput p3, v1, Lcom/flyersoft/staticlayout/MyMarginSpan;->leftMargin:F

    goto :goto_1

    :cond_2
    move-object v0, p0

    .line 2067
    :cond_3
    :goto_1
    invoke-direct {p0, v1, p1, v4}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->deleteTopMarginIfPriorHas(Lcom/flyersoft/staticlayout/MyMarginSpan;Landroid/text/SpannableStringBuilder;I)V

    .line 2068
    invoke-direct {p0, p1, v1, v4, v5}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    return-void
.end method

.method private start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V
    .locals 2

    .line 1578
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    const/16 v1, 0x11

    .line 1579
    invoke-virtual {p1, p2, v0, v0, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    return-void
.end method

.method private startA(Landroid/text/SpannableStringBuilder;Lorg/xml/sax/Attributes;)V
    .locals 3

    .line 2657
    const-string v0, ""

    const-string v1, "href"

    invoke-interface {p2, v0, v1}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2664
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v1

    .line 2665
    new-instance v2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Href;

    invoke-direct {v2, v0, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Href;-><init>(Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    const/16 p2, 0x11

    invoke-virtual {p1, v2, v1, v1, p2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    return-void
.end method

.method private startCSS(Landroid/text/SpannableStringBuilder;Ljava/lang/String;Lorg/xml/sax/Attributes;)Lcom/flyersoft/components/CSS$Style;
    .locals 8

    .line 1178
    sget-boolean v0, Lcom/flyersoft/tools/A;->disableCSS:Z

    const/4 v1, 0x3

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/flyersoft/tools/A;->cssAlignment:Z

    if-nez v0, :cond_3

    .line 1179
    :cond_0
    const-string v0, "align"

    invoke-interface {p3, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 1181
    const-string v3, "center"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 v0, 0x3

    goto :goto_0

    .line 1183
    :cond_1
    const-string v3, "right"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v0, 0x4

    goto :goto_0

    .line 1185
    :cond_2
    const-string v3, "justify"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x2

    goto :goto_0

    :cond_3
    const/4 v0, 0x0

    .line 1190
    :goto_0
    sget-boolean v3, Lcom/flyersoft/tools/A;->epubPageNum:Z

    const-string v4, "epub:type"

    const-string v5, "span"

    if-eqz v3, :cond_5

    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    const-string v3, "div"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    :cond_4
    if-eqz p3, :cond_5

    .line 1191
    const-string v3, "id"

    invoke-interface {p3, v3}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_5

    .line 1192
    const-string v6, "page"

    invoke-virtual {v3, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 1193
    invoke-interface {p3, v4}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_5

    .line 1194
    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    const-string v7, "pagebreak"

    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 1195
    invoke-direct {p0, v3, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->addEpub3PrintEditionNumbers(Ljava/lang/String;Landroid/text/SpannableStringBuilder;)V

    .line 1199
    :cond_5
    const-string v3, "class"

    invoke-direct {p0, p3, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getValue(Lorg/xml/sax/Attributes;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1200
    iget-object v6, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tags:Ljava/util/ArrayList;

    invoke-virtual {v6, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1201
    iget-object v6, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->classes:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1202
    invoke-direct {p0, p2, p3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getStyleFromAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Lcom/flyersoft/components/CSS$Style;

    move-result-object v3

    if-nez v3, :cond_6

    .line 1204
    const-string v6, "fieldset"

    invoke-virtual {p2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 1205
    new-instance v3, Lcom/flyersoft/components/CSS$Style;

    invoke-direct {v3}, Lcom/flyersoft/components/CSS$Style;-><init>()V

    .line 1206
    const-string v6, "display: block; padding:2em 1em 1em 1em; border: 2px groove gray;"

    invoke-virtual {v3, v6}, Lcom/flyersoft/components/CSS$Style;->scanPropertyForStyle(Ljava/lang/String;)V

    :cond_6
    if-lez v0, :cond_7

    .line 1210
    new-instance v6, Lcom/flyersoft/components/CSS$Style;

    invoke-direct {v6, v3}, Lcom/flyersoft/components/CSS$Style;-><init>(Lcom/flyersoft/components/CSS$Style;)V

    .line 1211
    iput v0, v6, Lcom/flyersoft/components/CSS$Style;->align:I

    move-object v3, v6

    .line 1214
    :cond_7
    sget-boolean v0, Lcom/flyersoft/tools/A;->indentParagraph:Z

    const/4 v6, 0x1

    if-eqz v0, :cond_8

    invoke-static {p2}, Lcom/flyersoft/components/CSS;->isHeaderTag(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    goto :goto_1

    :cond_8
    const/4 v0, 0x0

    :goto_1
    if-nez v3, :cond_9

    if-eqz v0, :cond_9

    .line 1216
    new-instance v3, Lcom/flyersoft/components/CSS$Style;

    invoke-direct {v3}, Lcom/flyersoft/components/CSS$Style;-><init>()V

    :cond_9
    if-eqz v0, :cond_a

    .line 1218
    iput-boolean v6, v3, Lcom/flyersoft/components/CSS$Style;->noindent:Z

    :cond_a
    if-eqz v3, :cond_b

    .line 1221
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    iput v0, v3, Lcom/flyersoft/components/CSS$Style;->htmlStartPos:I

    .line 1222
    :cond_b
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->cssStyles:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1224
    const-string v0, "h"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_11

    .line 1225
    invoke-interface {p3, v4}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    if-eqz p3, :cond_11

    .line 1226
    const-string v0, "title"

    invoke-virtual {p3, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_11

    if-nez v3, :cond_c

    .line 1228
    new-instance v3, Lcom/flyersoft/components/CSS$Style;

    invoke-direct {v3}, Lcom/flyersoft/components/CSS$Style;-><init>()V

    .line 1229
    :cond_c
    const-string v0, "subtitle"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_d

    const p3, 0x3f933333    # 1.15f

    goto :goto_2

    :cond_d
    const p3, 0x3fa66666    # 1.3f

    .line 1230
    :goto_2
    iget v0, v3, Lcom/flyersoft/components/CSS$Style;->fontSize:F

    cmpg-float v0, v0, p3

    if-gez v0, :cond_e

    .line 1231
    iput p3, v3, Lcom/flyersoft/components/CSS$Style;->fontSize:F

    .line 1232
    :cond_e
    iput-boolean v6, v3, Lcom/flyersoft/components/CSS$Style;->fontSizeInherited:Z

    .line 1233
    iget p3, v3, Lcom/flyersoft/components/CSS$Style;->align:I

    if-nez p3, :cond_f

    .line 1234
    iput v1, v3, Lcom/flyersoft/components/CSS$Style;->align:I

    .line 1235
    :cond_f
    iget-object p3, v3, Lcom/flyersoft/components/CSS$Style;->fontWeight:Ljava/lang/String;

    if-nez p3, :cond_10

    .line 1236
    const-string p3, "normal"

    iput-object p3, v3, Lcom/flyersoft/components/CSS$Style;->fontWeight:Ljava/lang/String;

    .line 1237
    :cond_10
    iget-object p3, v3, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    const/high16 v0, 0x40400000    # 3.0f

    iput v0, p3, Landroid/graphics/RectF;->bottom:F

    :cond_11
    const/4 p3, 0x0

    if-nez v3, :cond_12

    return-object p3

    .line 1246
    :cond_12
    invoke-direct {p0, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->hasWhiteSpaceWrap(Lcom/flyersoft/components/CSS$Style;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 1247
    iput-boolean v6, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->preTagStart:Z

    .line 1249
    :cond_13
    invoke-direct {p0, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->displayNone(Lcom/flyersoft/components/CSS$Style;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 1250
    new-instance p2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Hide;

    invoke-direct {p2, p3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Hide;-><init>(Lcom/flyersoft/staticlayout/HtmlToSpannedConverter-IA;)V

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    .line 1251
    iget-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->hideTag:Ljava/util/ArrayList;

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v3

    .line 1255
    :cond_14
    iget v0, v3, Lcom/flyersoft/components/CSS$Style;->pageBreak:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_15

    .line 1256
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->insertPgaeBreak(Landroid/text/SpannableStringBuilder;)V

    .line 1258
    :cond_15
    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    invoke-direct {p0, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->styleHasBlockDisplay(Lcom/flyersoft/components/CSS$Style;)Z

    move-result v0

    if-eqz v0, :cond_16

    goto :goto_3

    .line 1268
    :cond_16
    iget-object v0, v3, Lcom/flyersoft/components/CSS$Style;->backgroundColor:Ljava/lang/String;

    if-eqz v0, :cond_19

    .line 1269
    iget-object v0, v3, Lcom/flyersoft/components/CSS$Style;->backgroundColor:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getHtmlColor(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_19

    .line 1271
    new-instance v1, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$BackgroundColor;

    invoke-direct {v1, p3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$BackgroundColor;-><init>(Lcom/flyersoft/staticlayout/HtmlToSpannedConverter-IA;)V

    invoke-direct {p0, p1, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    .line 1272
    iget-object v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->backgroundColorTag:Ljava/util/ArrayList;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1273
    iget-object v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->backgroundColorValue:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 1259
    :cond_17
    :goto_3
    const-string v0, "code"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    invoke-static {v3}, Lcom/flyersoft/components/CSS;->hasParagraphProperty(Lcom/flyersoft/components/CSS$Style;)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 1260
    new-instance v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$MarginQuote;

    invoke-direct {v0, p2, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$MarginQuote;-><init>(Ljava/lang/String;Lcom/flyersoft/components/CSS$Style;)V

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    .line 1261
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->marginTag:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1263
    :cond_18
    iget v0, v3, Lcom/flyersoft/components/CSS$Style;->align:I

    if-lez v0, :cond_19

    iget v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableStart:I

    if-ne v0, v1, :cond_19

    .line 1264
    new-instance v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Alignment;

    iget v1, v3, Lcom/flyersoft/components/CSS$Style;->align:I

    invoke-direct {v0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Alignment;-><init>(I)V

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    .line 1265
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->alignTag:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1278
    :cond_19
    :goto_4
    iget-object v0, v3, Lcom/flyersoft/components/CSS$Style;->fontWeight:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/components/CSS;->isFontWeightLight(Ljava/lang/String;)Z

    move-result v0

    .line 1279
    iget-boolean v1, v3, Lcom/flyersoft/components/CSS$Style;->bold:Z

    if-nez v1, :cond_1b

    invoke-static {p2}, Lcom/flyersoft/components/CSS;->isHeaderTag(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1a

    if-nez v0, :cond_1a

    goto :goto_5

    :cond_1a
    if-eqz v0, :cond_1c

    .line 1283
    new-instance v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Light;

    invoke-direct {v0, p3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Light;-><init>(Lcom/flyersoft/staticlayout/HtmlToSpannedConverter-IA;)V

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    .line 1284
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->lightTag:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 1280
    :cond_1b
    :goto_5
    new-instance v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Bold;

    invoke-direct {v0, p3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Bold;-><init>(Lcom/flyersoft/staticlayout/HtmlToSpannedConverter-IA;)V

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    .line 1281
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->boldTag:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1287
    :cond_1c
    :goto_6
    invoke-direct {p0, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->isSuperStyle(Lcom/flyersoft/components/CSS$Style;)Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 1288
    new-instance v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Sup;

    invoke-direct {v0, p3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Sup;-><init>(Lcom/flyersoft/staticlayout/HtmlToSpannedConverter-IA;)V

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    .line 1290
    :cond_1d
    iget-boolean v0, v3, Lcom/flyersoft/components/CSS$Style;->italic:Z

    if-eqz v0, :cond_1e

    .line 1291
    new-instance v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Italic;

    invoke-direct {v0, p3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Italic;-><init>(Lcom/flyersoft/staticlayout/HtmlToSpannedConverter-IA;)V

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    .line 1292
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->italicTag:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1294
    :cond_1e
    iget-boolean v0, v3, Lcom/flyersoft/components/CSS$Style;->underline:Z

    if-eqz v0, :cond_1f

    .line 1295
    new-instance v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Underline;

    invoke-direct {v0, p3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Underline;-><init>(Lcom/flyersoft/staticlayout/HtmlToSpannedConverter-IA;)V

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    .line 1296
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->underlineTag:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1298
    :cond_1f
    iget-boolean v0, v3, Lcom/flyersoft/components/CSS$Style;->strikethrough:Z

    if-eqz v0, :cond_20

    .line 1299
    new-instance v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Strikethrough;

    invoke-direct {v0, p3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Strikethrough;-><init>(Lcom/flyersoft/staticlayout/HtmlToSpannedConverter-IA;)V

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    .line 1300
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->strikethroughTag:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1302
    :cond_20
    iget-object v0, v3, Lcom/flyersoft/components/CSS$Style;->shadow:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_21

    .line 1303
    new-instance v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Shadow;

    iget-object v1, v3, Lcom/flyersoft/components/CSS$Style;->shadow:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Shadow;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    .line 1304
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->shadowTag:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1306
    :cond_21
    iget v0, v3, Lcom/flyersoft/components/CSS$Style;->fontSize:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-gtz v0, :cond_22

    invoke-static {p2}, Lcom/flyersoft/components/CSS;->isHeaderTag(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_23

    .line 1307
    :cond_22
    new-instance v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Big;

    invoke-direct {v0, p2, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Big;-><init>(Ljava/lang/String;Lcom/flyersoft/components/CSS$Style;)V

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    .line 1308
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->fontSizeTag:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1310
    :cond_23
    iget-object v0, v3, Lcom/flyersoft/components/CSS$Style;->color:Ljava/lang/String;

    if-nez v0, :cond_24

    iget-object v0, v3, Lcom/flyersoft/components/CSS$Style;->fontFace:Ljava/lang/String;

    if-eqz v0, :cond_26

    .line 1311
    :cond_24
    new-instance v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Font;

    iget-object v4, v3, Lcom/flyersoft/components/CSS$Style;->color:Ljava/lang/String;

    iget-object v5, v3, Lcom/flyersoft/components/CSS$Style;->fontFace:Ljava/lang/String;

    iget-boolean v7, v3, Lcom/flyersoft/components/CSS$Style;->fontSizeInherited:Z

    invoke-direct {v0, v4, v5, v1, v7}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Font;-><init>(Ljava/lang/String;Ljava/lang/String;FZ)V

    .line 1312
    iget-object v1, v3, Lcom/flyersoft/components/CSS$Style;->text_fill_color:Ljava/lang/String;

    if-eqz v1, :cond_25

    const/4 v2, 0x1

    :cond_25
    iput-boolean v2, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Font;->has_fill_color:Z

    .line 1313
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v1

    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    const/16 v4, 0x11

    invoke-virtual {p1, v0, v1, v2, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 1314
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->fontTag:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1316
    :cond_26
    iget-object v0, v3, Lcom/flyersoft/components/CSS$Style;->text_fill_color:Ljava/lang/String;

    if-eqz v0, :cond_27

    .line 1317
    new-instance v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TextFillColor;

    invoke-direct {v0, p3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TextFillColor;-><init>(Lcom/flyersoft/staticlayout/HtmlToSpannedConverter-IA;)V

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    .line 1318
    iget-object p3, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->textFillColorTag:Ljava/util/ArrayList;

    invoke-virtual {p3, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1320
    :cond_27
    iget-object p3, v3, Lcom/flyersoft/components/CSS$Style;->emphasis_style:Ljava/lang/String;

    if-eqz p3, :cond_28

    .line 1321
    new-instance p3, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Emphasis_Tag;

    iget-object v0, v3, Lcom/flyersoft/components/CSS$Style;->emphasis_style:Ljava/lang/String;

    invoke-direct {p3, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Emphasis_Tag;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1, p3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    .line 1322
    iget-object p3, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->emphasisTag:Ljava/util/ArrayList;

    invoke-virtual {p3, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1324
    :cond_28
    iget-object p3, v3, Lcom/flyersoft/components/CSS$Style;->floatSp:Ljava/lang/String;

    if-eqz p3, :cond_29

    .line 1325
    new-instance p3, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FloatQuote;

    invoke-direct {p3, p2, v3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FloatQuote;-><init>(Ljava/lang/String;Lcom/flyersoft/components/CSS$Style;)V

    invoke-direct {p0, p1, p3}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    .line 1326
    iget-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->floatTag:Ljava/util/ArrayList;

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_29
    return-object v3
.end method

.method private startHtmlFont(Landroid/text/SpannableStringBuilder;Lorg/xml/sax/Attributes;)V
    .locals 7

    .line 2553
    const-string v0, "color"

    const-string v1, ""

    invoke-interface {p2, v1, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2554
    const-string v2, "face"

    invoke-interface {p2, v1, v2}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2556
    const-string v3, "size"

    invoke-interface {p2, v1, v3}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const/4 v1, 0x0

    const/4 v3, 0x0

    if-eqz p2, :cond_6

    .line 2560
    :try_start_0
    const-string v4, "%"

    invoke-virtual {p2, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    const/high16 v5, 0x3f800000    # 1.0f

    if-eqz v4, :cond_0

    .line 2561
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {p2, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p2

    const/high16 v3, 0x42c80000    # 100.0f

    div-float/2addr p2, v3

    sub-float/2addr p2, v5

    const/high16 v3, 0x3f000000    # 0.5f

    mul-float p2, p2, v3

    add-float/2addr p2, v5

    :goto_0
    move v3, p2

    goto :goto_1

    .line 2563
    :cond_0
    const-string v4, "em"

    invoke-virtual {p2, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    const/high16 v6, 0x40400000    # 3.0f

    if-eqz v4, :cond_1

    .line 2564
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x2

    invoke-virtual {p2, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p2

    div-float/2addr p2, v6

    goto :goto_0

    .line 2567
    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {p2, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v3

    .line 2568
    const-string v4, "+"

    invoke-virtual {p2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string v4, "-"

    invoke-virtual {p2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p2, :cond_3

    :cond_2
    add-float/2addr v3, v6

    :cond_3
    cmpl-float p2, v3, v5

    if-nez p2, :cond_4

    const p2, 0x3f333333    # 0.7f

    const v3, 0x3f333333    # 0.7f

    goto :goto_1

    :cond_4
    const/high16 p2, 0x40000000    # 2.0f

    cmpl-float p2, v3, p2

    if-nez p2, :cond_5

    const p2, 0x3f59999a    # 0.85f

    const v3, 0x3f59999a    # 0.85f

    goto :goto_1

    :cond_5
    div-float/2addr v3, v6

    goto :goto_1

    :catch_0
    move-exception p2

    .line 2575
    invoke-static {p2}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 2579
    :cond_6
    :goto_1
    new-instance p2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Font;

    invoke-direct {p2, v0, v2, v3, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Font;-><init>(Ljava/lang/String;Ljava/lang/String;FZ)V

    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v1

    const/16 v2, 0x11

    invoke-virtual {p1, p2, v0, v1, v2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    return-void
.end method

.method private startImg(Ljava/lang/String;Lorg/xml/sax/Attributes;Z)V
    .locals 30

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v7, p2

    const/4 v8, 0x0

    .line 2260
    iput-object v8, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->savedImgAttributesForNextChar:Lorg/xml/sax/Attributes;

    .line 2261
    iget-object v9, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->spanBulder:Landroid/text/SpannableStringBuilder;

    .line 2265
    const-string v10, "audio"

    invoke-virtual {v1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const-string v11, "video"

    const-string v3, "src"

    const/4 v12, 0x1

    if-eqz v2, :cond_1

    .line 2266
    invoke-interface {v7, v3}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_0

    goto/16 :goto_33

    .line 2269
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "#audio#"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_0
    move-object v14, v2

    const/4 v2, 0x1

    goto :goto_2

    .line 2271
    :cond_1
    invoke-virtual {v1, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 2272
    invoke-interface {v7, v3}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    goto/16 :goto_33

    .line 2275
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "#video#"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 2277
    :cond_3
    const-string v2, "img"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 2278
    invoke-interface {v7, v3}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_4
    :goto_1
    move-object v14, v2

    const/4 v2, 0x0

    goto :goto_2

    .line 2280
    :cond_5
    const-string v2, "xlink:href"

    invoke-interface {v7, v2}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_6

    .line 2282
    const-string v2, "href"

    invoke-interface {v7, v2}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_6
    if-nez v2, :cond_4

    .line 2284
    const-string v2, "l:href"

    invoke-interface {v7, v2}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 2285
    const-string v3, "#"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 2286
    invoke-virtual {v2, v12}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    :goto_2
    if-nez v14, :cond_7

    goto/16 :goto_33

    .line 2293
    :cond_7
    const-string v3, "alt"

    invoke-interface {v7, v3}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 2294
    const-string v3, "class"

    move-object v4, v3

    invoke-direct {v0, v7, v4}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getValue(Lorg/xml/sax/Attributes;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 2295
    const-string v5, "id"

    invoke-direct {v0, v7, v5}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getValue(Lorg/xml/sax/Attributes;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 2296
    const-string v6, "style"

    invoke-interface {v7, v6}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 2297
    invoke-static {v3}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_8

    invoke-static {v5}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_8

    const/16 v16, 0x1

    goto :goto_3

    :cond_8
    const/16 v16, 0x0

    .line 2301
    :goto_3
    const-string v8, "nobreak"

    invoke-virtual {v8, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    .line 2304
    const-class v13, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Href;

    invoke-direct {v0, v9, v13}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getLast(Landroid/text/Spanned;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v13

    if-eqz v13, :cond_9

    .line 2305
    check-cast v13, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Href;

    goto :goto_4

    :cond_9
    const/4 v13, 0x0

    :goto_4
    if-eqz p3, :cond_a

    .line 2307
    iget-object v2, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->savedCssForNextChar:Lcom/flyersoft/components/CSS$Style;

    move-object v12, v6

    move/from16 v22, v8

    :goto_5
    move-object v8, v4

    goto :goto_6

    :cond_a
    if-eqz v2, :cond_b

    move-object v12, v6

    move/from16 v22, v8

    const/4 v2, 0x0

    goto :goto_5

    .line 2308
    :cond_b
    iget v2, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->chapterId:I

    invoke-direct {v0, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getChapter(I)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v2

    move-object/from16 v18, v4

    move-object v4, v2

    move-object v2, v5

    iget-object v5, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tags:Ljava/util/ArrayList;

    move-object/from16 v19, v6

    iget-object v6, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->classes:Ljava/util/ArrayList;

    move/from16 v22, v8

    move-object/from16 v8, v18

    move-object/from16 v12, v19

    invoke-static/range {v1 .. v6}, Lcom/flyersoft/staticlayout/MyHtml;->getClassStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/flyersoft/books/BaseEBook$Chapter;Ljava/util/ArrayList;Ljava/util/ArrayList;)Lcom/flyersoft/components/CSS$Style;

    move-result-object v2

    :goto_6
    if-eqz v12, :cond_c

    .line 2312
    new-instance v4, Lcom/flyersoft/components/CSS$Style;

    invoke-direct {v4, v2}, Lcom/flyersoft/components/CSS$Style;-><init>(Lcom/flyersoft/components/CSS$Style;)V

    .line 2313
    invoke-virtual {v4, v12}, Lcom/flyersoft/components/CSS$Style;->scanPropertyForStyle(Ljava/lang/String;)V

    goto :goto_7

    :cond_c
    if-nez v16, :cond_d

    .line 2314
    invoke-static {v3}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_d

    move-object v4, v2

    const/16 v16, 0x1

    goto :goto_7

    :cond_d
    move-object v4, v2

    .line 2318
    :goto_7
    const-string v5, "align"

    invoke-interface {v7, v5}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 2319
    const-string v6, "right"

    const-string v12, "left"

    if-eqz v5, :cond_f

    .line 2320
    invoke-virtual {v5, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    .line 2322
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_e

    move-object/from16 v19, v6

    const/4 v5, 0x4

    goto :goto_8

    :cond_e
    move/from16 v5, v19

    move-object/from16 v19, v6

    goto :goto_8

    :cond_f
    move-object/from16 v19, v6

    const/4 v5, 0x0

    :goto_8
    const/4 v6, 0x1

    if-eq v5, v6, :cond_10

    const/4 v6, 0x4

    if-ne v5, v6, :cond_12

    .line 2327
    :cond_10
    new-instance v6, Lcom/flyersoft/components/CSS$Style;

    invoke-direct {v6, v4}, Lcom/flyersoft/components/CSS$Style;-><init>(Lcom/flyersoft/components/CSS$Style;)V

    const/4 v4, 0x1

    if-ne v5, v4, :cond_11

    goto :goto_9

    :cond_11
    move-object/from16 v12, v19

    .line 2328
    :goto_9
    iput-object v12, v6, Lcom/flyersoft/components/CSS$Style;->floatSp:Ljava/lang/String;

    move-object v4, v6

    .line 2331
    :cond_12
    const-string v5, "duokan"

    if-eqz v3, :cond_13

    invoke-virtual {v3, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_13

    if-eqz v15, :cond_13

    const/4 v3, 0x1

    const/4 v6, 0x1

    goto :goto_a

    :cond_13
    const/4 v3, 0x0

    const/4 v6, 0x0

    .line 2335
    :goto_a
    const-string v12, "block"

    move/from16 v18, v3

    const-string v3, "em"

    move/from16 v19, v6

    const-string v6, "100%"

    if-eqz v4, :cond_1f

    .line 2336
    invoke-direct {v0, v4}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->displayNone(Lcom/flyersoft/components/CSS$Style;)Z

    move-result v20

    if-eqz v20, :cond_14

    goto/16 :goto_33

    :cond_14
    move-object/from16 v20, v15

    .line 2338
    const-string v15, "inline"

    move-object/from16 v23, v11

    iget-object v11, v4, Lcom/flyersoft/components/CSS$Style;->display:Ljava/lang/String;

    invoke-virtual {v15, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_15

    const/4 v11, 0x0

    :goto_b
    const/16 v18, 0x1

    goto :goto_c

    .line 2340
    :cond_15
    const-string v11, "inline-block"

    iget-object v15, v4, Lcom/flyersoft/components/CSS$Style;->display:Ljava/lang/String;

    invoke-virtual {v11, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_16

    .line 2341
    iget-object v11, v4, Lcom/flyersoft/components/CSS$Style;->height:Ljava/lang/String;

    if-nez v11, :cond_17

    iget-object v11, v4, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    invoke-virtual {v6, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_17

    iget-object v11, v4, Lcom/flyersoft/components/CSS$Style;->maxWidth:Ljava/lang/String;

    invoke-virtual {v6, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_17

    const/4 v11, 0x0

    const/16 v16, 0x0

    goto :goto_b

    .line 2345
    :cond_16
    iget-object v11, v4, Lcom/flyersoft/components/CSS$Style;->display:Ljava/lang/String;

    invoke-virtual {v12, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_17

    const/4 v11, 0x1

    goto :goto_c

    :cond_17
    const/4 v11, 0x0

    .line 2347
    :goto_c
    iget-object v15, v4, Lcom/flyersoft/components/CSS$Style;->height:Ljava/lang/String;

    invoke-static {v15}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v15

    const/high16 v24, 0x3f800000    # 1.0f

    cmpg-float v24, v15, v24

    if-gtz v24, :cond_18

    const/high16 v24, 0x3f000000    # 0.5f

    cmpl-float v15, v15, v24

    if-ltz v15, :cond_18

    const/16 v18, 0x1

    :cond_18
    if-nez v18, :cond_1d

    .line 2350
    iget-object v15, v4, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    if-eqz v15, :cond_1d

    iget-object v15, v4, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    invoke-virtual {v15, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v15

    move/from16 v24, v11

    const-string v11, "px"

    if-nez v15, :cond_1a

    iget-object v15, v4, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    invoke-virtual {v15, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_19

    goto :goto_d

    :cond_19
    move-object/from16 v25, v10

    goto :goto_f

    .line 2351
    :cond_1a
    :goto_d
    iget-object v15, v4, Lcom/flyersoft/components/CSS$Style;->maxWidth:Ljava/lang/String;

    invoke-virtual {v6, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_1c

    .line 2352
    iget-object v15, v4, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    invoke-static {v15}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v15

    move-object/from16 v25, v10

    .line 2353
    iget-object v10, v4, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    invoke-virtual {v10, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_1b

    const/4 v10, 0x5

    if-ge v15, v10, :cond_1b

    :goto_e
    const/4 v10, 0x1

    const/16 v18, 0x1

    goto :goto_11

    .line 2355
    :cond_1b
    iget-object v10, v4, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_1e

    const/16 v10, 0xf

    if-ge v15, v10, :cond_1e

    goto :goto_e

    :cond_1c
    move-object/from16 v25, v10

    goto :goto_10

    :cond_1d
    move-object/from16 v25, v10

    move/from16 v24, v11

    :goto_f
    if-eqz v18, :cond_1e

    if-nez v19, :cond_1e

    .line 2358
    invoke-direct {v0, v4}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->isHeightAndWidthOnlyAuto(Lcom/flyersoft/components/CSS$Style;)Z

    move-result v10

    if-eqz v10, :cond_1e

    const/4 v10, 0x0

    const/16 v18, 0x0

    goto :goto_11

    :cond_1e
    :goto_10
    const/4 v10, 0x0

    goto :goto_11

    :cond_1f
    move-object/from16 v25, v10

    move-object/from16 v23, v11

    move-object/from16 v20, v15

    const/4 v10, 0x0

    const/16 v24, 0x0

    :goto_11
    if-nez v19, :cond_21

    if-eqz v13, :cond_21

    .line 2362
    iget-object v11, v13, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Href;->mAttributes:Lorg/xml/sax/Attributes;

    invoke-direct {v0, v11, v8}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getValue(Lorg/xml/sax/Attributes;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_21

    .line 2363
    invoke-virtual {v8, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_20

    const-string v5, "foot"

    invoke-virtual {v8, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_21

    :cond_20
    const/4 v5, 0x1

    const/16 v18, 0x1

    goto :goto_12

    :cond_21
    move/from16 v5, v19

    .line 2367
    :goto_12
    invoke-virtual {v9}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v8

    const/16 v11, 0xa

    if-eqz v8, :cond_23

    invoke-virtual {v9}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v8

    const/16 v21, 0x1

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v9, v8}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v8

    if-ne v8, v11, :cond_22

    goto :goto_13

    :cond_22
    const/4 v8, 0x0

    goto :goto_14

    :cond_23
    :goto_13
    const/4 v8, 0x1

    :goto_14
    if-eqz v18, :cond_24

    if-eqz v16, :cond_24

    if-eqz v8, :cond_24

    if-nez p3, :cond_24

    .line 2372
    invoke-direct {v0, v1, v7, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->savedImgAttributesForNextChar(Ljava/lang/String;Lorg/xml/sax/Attributes;Lcom/flyersoft/components/CSS$Style;)V

    const/4 v15, 0x1

    const/16 v18, 0x0

    goto :goto_15

    :cond_24
    const/4 v15, 0x0

    .line 2374
    :goto_15
    sget-boolean v16, Lcom/flyersoft/tools/A;->fitImageToScreen:Z

    if-eqz v16, :cond_25

    const/16 v18, 0x0

    :cond_25
    const/16 v16, 0xa

    if-eqz v4, :cond_27

    .line 2376
    iget-object v11, v4, Lcom/flyersoft/components/CSS$Style;->floatSp:Ljava/lang/String;

    if-eqz v11, :cond_27

    sget-boolean v11, Lcom/flyersoft/tools/A;->disableCSS:Z

    if-eqz v11, :cond_26

    sget-boolean v11, Lcom/flyersoft/tools/A;->cssOthers:Z

    if-nez v11, :cond_27

    .line 2377
    :cond_26
    invoke-direct {v0, v9}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->removeFloatInSameLine(Landroid/text/SpannableStringBuilder;)Z

    move-result v11

    if-nez v11, :cond_27

    const/4 v11, 0x1

    goto :goto_16

    :cond_27
    const/4 v11, 0x0

    :goto_16
    move/from16 v26, v5

    .line 2381
    iget-object v5, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->mMyImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    const/16 v27, 0x3

    if-eqz v5, :cond_4a

    .line 2382
    invoke-static {v14}, Lcom/flyersoft/tools/A;->isHttpImage(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_28

    .line 2383
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v5

    move/from16 v19, v8

    invoke-static {v14}, Lcom/flyersoft/tools/A;->generateUrlImageCacheName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v5, v8}, Lcom/flyersoft/tools/T;->getFileDrawable(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    goto :goto_17

    :cond_28
    move/from16 v19, v8

    const/4 v5, 0x0

    :goto_17
    if-eqz v11, :cond_29

    .line 2385
    const-string v8, "auto"

    move/from16 v28, v10

    iget-object v10, v4, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    invoke-virtual {v8, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_2a

    const/4 v8, 0x1

    goto :goto_18

    :cond_29
    move/from16 v28, v10

    :cond_2a
    const/4 v8, 0x0

    .line 2386
    :goto_18
    sget-boolean v10, Lcom/flyersoft/tools/A;->fitImageToScreen:Z

    if-nez v10, :cond_2c

    if-eqz v4, :cond_2b

    iget-object v10, v4, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2b

    goto :goto_19

    :cond_2b
    const/4 v6, 0x0

    goto :goto_1a

    :cond_2c
    :goto_19
    const/4 v6, 0x1

    .line 2387
    :goto_1a
    sget-object v10, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-nez v10, :cond_2e

    if-nez v5, :cond_2d

    .line 2389
    iget-object v2, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->mMyImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    invoke-interface {v2, v14, v8}, Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;->getDrawable(Ljava/lang/String;Z)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    move-object v8, v2

    goto :goto_1b

    :cond_2d
    move-object v8, v5

    :goto_1b
    move/from16 v19, v18

    const/16 v17, 0x0

    const/16 v21, 0x1

    goto/16 :goto_2c

    :cond_2e
    if-eqz v5, :cond_2f

    .line 2391
    invoke-static {v5, v8}, Lcom/flyersoft/tools/A;->getDrawableBounds(Landroid/graphics/drawable/Drawable;Z)Landroid/graphics/Rect;

    move-result-object v8

    goto :goto_1c

    :cond_2f
    iget-object v10, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->mMyImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    invoke-interface {v10, v14, v8}, Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;->getDrawableBounds(Ljava/lang/String;Z)Landroid/graphics/Rect;

    move-result-object v8

    :goto_1c
    if-eqz v18, :cond_34

    if-eqz v8, :cond_34

    .line 2393
    invoke-direct {v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getLineHeight()I

    move-result v3

    if-nez v28, :cond_31

    if-eqz v19, :cond_31

    .line 2394
    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v6

    mul-int/lit8 v12, v3, 0x3

    div-int/lit8 v15, v12, 0x2

    if-le v6, v15, :cond_31

    if-nez p3, :cond_31

    .line 2395
    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v6

    if-le v6, v12, :cond_30

    const/4 v10, 0x3

    goto :goto_1d

    :cond_30
    const/4 v10, 0x2

    :goto_1d
    mul-int v3, v3, v10

    .line 2397
    invoke-direct {v0, v1, v7, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->savedImgAttributesForNextChar(Ljava/lang/String;Lorg/xml/sax/Attributes;Lcom/flyersoft/components/CSS$Style;)V

    const/16 v18, 0x0

    .line 2399
    :cond_31
    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v2

    if-nez v2, :cond_32

    move v2, v3

    goto :goto_1e

    :cond_32
    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v2

    mul-int v2, v2, v3

    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v6

    div-int/2addr v2, v6

    .line 2400
    :goto_1e
    invoke-static {}, Lcom/flyersoft/tools/A;->getPageWidth()I

    move-result v6

    mul-int/lit8 v6, v6, 0x8

    div-int/lit8 v6, v6, 0xa

    if-ge v2, v6, :cond_33

    .line 2401
    new-instance v6, Landroid/graphics/Rect;

    const/4 v8, 0x0

    invoke-direct {v6, v8, v8, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    move-object v8, v6

    :cond_33
    move-object/from16 v17, v8

    move/from16 v19, v18

    const/16 v21, 0x1

    move-object v8, v5

    goto/16 :goto_2c

    :cond_34
    if-eqz v8, :cond_49

    .line 2404
    const-string v2, "%"

    if-eqz v6, :cond_38

    const/16 v19, 0x2

    iget-object v10, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->cssStyles:Ljava/util/ArrayList;

    invoke-static {v10}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v10

    if-nez v10, :cond_37

    .line 2405
    iget-object v10, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->cssStyles:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v28

    move-object/from16 v29, v5

    const/16 v21, 0x1

    add-int/lit8 v5, v28, -0x1

    invoke-virtual {v10, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/flyersoft/components/CSS$Style;

    if-eqz v5, :cond_36

    .line 2406
    iget-object v10, v5, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    if-eqz v10, :cond_36

    iget-object v10, v5, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    move/from16 v28, v6

    const-string v6, "100"

    invoke-virtual {v10, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_39

    iget-object v6, v5, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    invoke-virtual {v6, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_39

    .line 2408
    iget-object v6, v5, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    .line 2409
    iget-object v5, v5, Lcom/flyersoft/components/CSS$Style;->display:Ljava/lang/String;

    invoke-virtual {v12, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    move-object/from16 v17, v6

    if-eqz v5, :cond_35

    const/4 v6, 0x1

    goto :goto_1f

    :cond_35
    move/from16 v6, v24

    :goto_1f
    const/16 v28, 0x0

    goto :goto_22

    :cond_36
    move/from16 v28, v6

    goto :goto_21

    :cond_37
    move-object/from16 v29, v5

    move/from16 v28, v6

    goto :goto_20

    :cond_38
    move-object/from16 v29, v5

    move/from16 v28, v6

    const/16 v19, 0x2

    :goto_20
    const/16 v21, 0x1

    :cond_39
    :goto_21
    move/from16 v6, v24

    const/16 v17, 0x0

    .line 2413
    :goto_22
    invoke-static {}, Lcom/flyersoft/tools/A;->getPageWidth2()I

    move-result v5

    if-eqz v28, :cond_3b

    if-eqz v15, :cond_3a

    .line 2416
    new-instance v2, Landroid/graphics/Rect;

    div-int/lit8 v3, v5, 0x2

    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v10

    mul-int v10, v10, v5

    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v5

    div-int/2addr v10, v5

    div-int/lit8 v10, v10, 0x2

    const/4 v12, 0x0

    invoke-direct {v2, v12, v12, v3, v10}, Landroid/graphics/Rect;-><init>(IIII)V

    goto :goto_23

    :cond_3a
    const/4 v12, 0x0

    .line 2418
    new-instance v2, Landroid/graphics/Rect;

    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v3

    mul-int v3, v3, v5

    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v8

    div-int/2addr v3, v8

    invoke-direct {v2, v12, v12, v5, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    :goto_23
    move-object/from16 v17, v2

    move/from16 v24, v6

    goto/16 :goto_2b

    :cond_3b
    if-eqz v4, :cond_48

    .line 2419
    iget-object v10, v4, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    if-nez v10, :cond_3c

    iget-object v10, v4, Lcom/flyersoft/components/CSS$Style;->height:Ljava/lang/String;

    if-eqz v10, :cond_48

    .line 2420
    :cond_3c
    iget-object v10, v4, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    const-string v12, "pt"

    if-eqz v10, :cond_43

    .line 2421
    iget-object v10, v4, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    invoke-virtual {v10, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3e

    if-eqz v17, :cond_3d

    goto :goto_24

    .line 2422
    :cond_3d
    iget-object v2, v4, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    move-object/from16 v17, v2

    :goto_24
    invoke-static/range {v17 .. v17}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v2

    if-lez v2, :cond_48

    const/16 v3, 0x64

    if-ge v2, v3, :cond_48

    .line 2424
    new-instance v10, Landroid/graphics/Rect;

    mul-int v12, v5, v2

    div-int/2addr v12, v3

    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v15

    mul-int v15, v15, v5

    mul-int v15, v15, v2

    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v2

    mul-int/lit8 v2, v2, 0x64

    div-int/2addr v15, v2

    const/4 v8, 0x0

    invoke-direct {v10, v8, v8, v12, v15}, Landroid/graphics/Rect;-><init>(IIII)V

    move-object v8, v10

    goto/16 :goto_29

    .line 2425
    :cond_3e
    iget-object v2, v4, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    invoke-virtual {v2, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3f

    iget-object v2, v4, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_48

    .line 2426
    :cond_3f
    iget-object v2, v4, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    invoke-virtual {v2, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_40

    iget-object v2, v4, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v2

    int-to-float v2, v2

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    goto :goto_25

    .line 2427
    :cond_40
    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v2

    iget-object v3, v4, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->string2Float(Ljava/lang/String;)F

    move-result v3

    mul-float v2, v2, v3

    float-to-int v2, v2

    :goto_25
    if-ge v2, v5, :cond_48

    .line 2428
    div-int/lit8 v5, v5, 0xa

    if-le v2, v5, :cond_48

    .line 2429
    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v3

    mul-int v3, v3, v2

    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v5

    div-int/2addr v3, v5

    .line 2430
    iget-object v5, v4, Lcom/flyersoft/components/CSS$Style;->height:Ljava/lang/String;

    if-eqz v5, :cond_41

    iget-object v5, v4, Lcom/flyersoft/components/CSS$Style;->height:Ljava/lang/String;

    invoke-virtual {v5, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_41

    .line 2431
    iget-object v3, v4, Lcom/flyersoft/components/CSS$Style;->height:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v3

    int-to-float v3, v3

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    .line 2432
    :cond_41
    new-instance v5, Landroid/graphics/Rect;

    if-lez v3, :cond_42

    goto :goto_26

    :cond_42
    move v3, v2

    :goto_26
    const/4 v8, 0x0

    invoke-direct {v5, v8, v8, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    move-object v8, v5

    goto/16 :goto_29

    .line 2435
    :cond_43
    iget-object v2, v4, Lcom/flyersoft/components/CSS$Style;->height:Ljava/lang/String;

    if-eqz v2, :cond_48

    .line 2436
    iget-object v2, v4, Lcom/flyersoft/components/CSS$Style;->height:Ljava/lang/String;

    invoke-virtual {v2, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_44

    iget-object v2, v4, Lcom/flyersoft/components/CSS$Style;->height:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_48

    .line 2437
    :cond_44
    iget-object v2, v4, Lcom/flyersoft/components/CSS$Style;->height:Ljava/lang/String;

    invoke-virtual {v2, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_45

    iget-object v2, v4, Lcom/flyersoft/components/CSS$Style;->height:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v2

    int-to-float v2, v2

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    goto :goto_27

    .line 2438
    :cond_45
    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v2

    iget-object v3, v4, Lcom/flyersoft/components/CSS$Style;->height:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->string2Float(Ljava/lang/String;)F

    move-result v3

    mul-float v2, v2, v3

    float-to-int v2, v2

    :goto_27
    int-to-float v3, v2

    .line 2439
    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v5

    const/high16 v10, 0x41a00000    # 20.0f

    mul-float v5, v5, v10

    cmpg-float v5, v3, v5

    if-gez v5, :cond_48

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v5

    const/high16 v10, 0x40000000    # 2.0f

    div-float/2addr v5, v10

    cmpl-float v3, v3, v5

    if-lez v3, :cond_48

    .line 2440
    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v3

    mul-int v3, v3, v2

    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v5

    div-int/2addr v3, v5

    .line 2441
    iget-object v5, v4, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    if-eqz v5, :cond_46

    iget-object v5, v4, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    invoke-virtual {v5, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_46

    .line 2442
    iget-object v3, v4, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v3

    int-to-float v3, v3

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    .line 2443
    :cond_46
    new-instance v8, Landroid/graphics/Rect;

    if-lez v3, :cond_47

    goto :goto_28

    :cond_47
    move v3, v2

    :goto_28
    const/4 v12, 0x0

    invoke-direct {v8, v12, v12, v3, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    :cond_48
    :goto_29
    move/from16 v24, v6

    goto :goto_2a

    :cond_49
    move-object/from16 v29, v5

    const/16 v21, 0x1

    :goto_2a
    move-object/from16 v17, v8

    :goto_2b
    move/from16 v19, v18

    move-object/from16 v8, v29

    goto :goto_2c

    :cond_4a
    const/16 v21, 0x1

    move/from16 v19, v18

    const/4 v8, 0x0

    const/16 v17, 0x0

    :goto_2c
    if-nez v8, :cond_4b

    .line 2452
    invoke-static {v14}, Lcom/flyersoft/tools/A;->isHttpImage(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4b

    invoke-static {v14}, Lcom/flyersoft/tools/A;->generateUrlImageCacheName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4b

    const/4 v6, 0x1

    goto :goto_2d

    :cond_4b
    const/4 v6, 0x0

    :goto_2d
    if-nez v8, :cond_4f

    if-eqz v17, :cond_4c

    .line 2453
    invoke-virtual/range {v17 .. v17}, Landroid/graphics/Rect;->width()I

    move-result v2

    if-gtz v2, :cond_4f

    :cond_4c
    if-eqz v14, :cond_4e

    .line 2454
    invoke-virtual {v14}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    const-string v3, ".svg"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4d

    invoke-static {v14}, Lcom/flyersoft/tools/A;->isHttpImage(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4e

    invoke-static {v14}, Lcom/flyersoft/tools/A;->generateUrlImageCacheName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4e

    .line 2455
    :cond_4d
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$drawable;->unknown_svg:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    goto :goto_2e

    .line 2457
    :cond_4e
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$drawable;->unknown_image:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    :goto_2e
    move-object v8, v2

    .line 2458
    invoke-virtual {v8}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    invoke-virtual {v8}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v3

    const/4 v12, 0x0

    invoke-virtual {v8, v12, v12, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 2459
    invoke-virtual {v8}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v17

    goto :goto_2f

    :cond_4f
    const/4 v12, 0x0

    :goto_2f
    move-object v15, v8

    move-object/from16 v16, v17

    move-object/from16 v17, v14

    if-eqz v11, :cond_50

    .line 2463
    new-instance v14, Lcom/flyersoft/staticlayout/MyImageSpan;

    iget-object v2, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->mMyImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    move-object/from16 v18, v2

    move-object/from16 v2, v20

    move/from16 v20, v24

    invoke-direct/range {v14 .. v20}, Lcom/flyersoft/staticlayout/MyImageSpan;-><init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/Rect;Ljava/lang/String;Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;ZZ)V

    invoke-direct {v0, v9, v4, v14, v7}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->addImgFloatQuote(Landroid/text/SpannableStringBuilder;Lcom/flyersoft/components/CSS$Style;Lcom/flyersoft/staticlayout/MyImageSpan;Lorg/xml/sax/Attributes;)Z

    move-result v3

    if-eqz v3, :cond_51

    goto/16 :goto_33

    :cond_50
    move-object/from16 v2, v20

    move/from16 v20, v24

    :cond_51
    if-nez v22, :cond_54

    if-nez v20, :cond_54

    move-object/from16 v3, v25

    .line 2468
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_55

    move-object/from16 v3, v23

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_52

    goto :goto_30

    :cond_52
    if-eqz v15, :cond_53

    .line 2470
    invoke-virtual {v15}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    invoke-static {}, Lcom/flyersoft/tools/A;->getPageWidth()I

    move-result v3

    div-int/lit8 v3, v3, 0x3

    if-le v1, v3, :cond_53

    goto :goto_30

    :cond_53
    if-eqz v16, :cond_54

    .line 2472
    invoke-virtual/range {v16 .. v16}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-static {}, Lcom/flyersoft/tools/A;->getPageWidth()I

    move-result v3

    div-int/lit8 v3, v3, 0x3

    if-le v1, v3, :cond_54

    goto :goto_30

    :cond_54
    move/from16 v21, v20

    :cond_55
    :goto_30
    if-eqz v21, :cond_56

    .line 2475
    iget v1, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->chapterId:I

    invoke-direct {v0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getChapter(I)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v1

    if-eqz v1, :cond_56

    iget v1, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->chapterId:I

    invoke-direct {v0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getChapter(I)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v1

    iget-object v1, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->hasImageOnly:Ljava/lang/String;

    if-eqz v1, :cond_56

    goto :goto_31

    :cond_56
    move/from16 v12, v21

    :goto_31
    if-eqz v12, :cond_57

    .line 2478
    invoke-direct {v0, v9}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBrSingle(Landroid/text/SpannableStringBuilder;)V

    :cond_57
    const v1, 0xfffc

    .line 2479
    invoke-virtual {v9, v1}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 2481
    invoke-virtual {v9}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v1

    .line 2482
    new-instance v14, Lcom/flyersoft/staticlayout/MyImageSpan;

    iget-object v3, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->mMyImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    move-object/from16 v18, v3

    invoke-direct/range {v14 .. v20}, Lcom/flyersoft/staticlayout/MyImageSpan;-><init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/Rect;Ljava/lang/String;Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;ZZ)V

    move-object/from16 v3, v17

    add-int/lit8 v4, v1, -0x1

    invoke-direct {v0, v9, v14, v4, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    if-eqz v6, :cond_5a

    .line 2485
    new-instance v1, Lcom/flyersoft/staticlayout/MyUrlSpan;

    invoke-direct {v1, v3}, Lcom/flyersoft/staticlayout/MyUrlSpan;-><init>(Ljava/lang/String;)V

    .line 2486
    sget v4, Lcom/flyersoft/moonreaderp/R$string;->download_url_image:I

    invoke-static {v4}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 2487
    invoke-virtual {v9, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 2488
    invoke-virtual {v9}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v5

    .line 2489
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    sub-int v4, v5, v4

    invoke-direct {v0, v9, v1, v4, v5}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 2491
    sget-object v1, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-nez v1, :cond_58

    .line 2492
    invoke-static {}, Lcom/flyersoft/tools/A;->getUnloadedImages()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_59

    .line 2493
    invoke-static {}, Lcom/flyersoft/tools/A;->getUnloadedImages()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_32

    .line 2495
    :cond_58
    sget-object v1, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-eqz v1, :cond_59

    iget v1, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->chapterId:I

    if-ltz v1, :cond_59

    sget-object v4, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v4}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v1, v4, :cond_59

    .line 2496
    sget-object v1, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    iget v4, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->chapterId:I

    invoke-virtual {v1, v4}, Lcom/flyersoft/books/BaseEBook;->get(I)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v1

    iget-object v1, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->unloadedImages:Ljava/util/ArrayList;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_59

    .line 2497
    sget-object v1, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    iget v4, v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->chapterId:I

    invoke-virtual {v1, v4}, Lcom/flyersoft/books/BaseEBook;->get(I)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v1

    iget-object v1, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->unloadedImages:Ljava/util/ArrayList;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_59
    :goto_32
    move v1, v5

    :cond_5a
    if-eqz v26, :cond_5c

    .line 2501
    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_5c

    if-eqz v13, :cond_5b

    iget-object v3, v13, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Href;->mHref:Ljava/lang/String;

    if-nez v3, :cond_5c

    .line 2502
    :cond_5b
    new-instance v3, Lcom/flyersoft/staticlayout/MyUrlSpan;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "***"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/flyersoft/staticlayout/MyUrlSpan;-><init>(Ljava/lang/String;)V

    add-int/lit8 v4, v1, -0x1

    invoke-direct {v0, v9, v3, v4, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 2503
    sget-boolean v1, Lcom/flyersoft/tools/A;->footnoteInChapterText:Z

    if-eqz v1, :cond_5c

    .line 2504
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, " ["

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 2505
    invoke-virtual {v9, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 2506
    invoke-virtual {v9}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    .line 2507
    new-instance v3, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;

    const v4, 0x3f4ccccd    # 0.8f

    invoke-direct {v3, v4}, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;-><init>(F)V

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    sub-int v4, v2, v4

    invoke-direct {v0, v9, v3, v4, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 2508
    new-instance v3, Landroid/text/style/ForegroundColorSpan;

    const v4, -0x777778

    invoke-direct {v3, v4}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int v1, v2, v1

    invoke-direct {v0, v9, v3, v1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    :cond_5c
    if-eqz v12, :cond_5d

    .line 2513
    invoke-direct {v0, v9}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleBr2(Landroid/text/SpannableStringBuilder;)V

    :cond_5d
    :goto_33
    return-void
.end method

.method private startRuby(Landroid/text/SpannableStringBuilder;)V
    .locals 2

    .line 1081
    const-class v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$RubyTag;

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->getLast(Landroid/text/Spanned;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1082
    invoke-virtual {p1, v0}, Landroid/text/SpannableStringBuilder;->removeSpan(Ljava/lang/Object;)V

    .line 1083
    :cond_0
    new-instance v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$RubyTag;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$RubyTag;-><init>(Lcom/flyersoft/staticlayout/HtmlToSpannedConverter-IA;)V

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    const/4 p1, 0x0

    .line 1084
    iput-boolean p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->rubyRtStart:Z

    .line 1085
    iput-object v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->rubyRtText:Ljava/lang/String;

    return-void
.end method

.method private startRubyRt(Landroid/text/SpannableStringBuilder;)V
    .locals 2

    .line 1113
    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->rubyRtText:Ljava/lang/String;

    if-nez v0, :cond_0

    const/4 p1, 0x1

    .line 1114
    iput-boolean p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->rubyRtStart:Z

    .line 1115
    const-string p1, ""

    iput-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->rubyRtText:Ljava/lang/String;

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 1117
    iput-boolean v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->rubyRtStart:Z

    .line 1118
    new-instance v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Small;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Small;-><init>(Lcom/flyersoft/staticlayout/HtmlToSpannedConverter-IA;)V

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->start(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    return-void
.end method

.method private styleHasBlockDisplay(Lcom/flyersoft/components/CSS$Style;)Z
    .locals 1

    if-eqz p1, :cond_0

    .line 1073
    const-string v0, "block"

    iget-object p1, p1, Lcom/flyersoft/components/CSS$Style;->display:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private styleHasInlineDisplay(Lcom/flyersoft/components/CSS$Style;)Z
    .locals 1

    if-eqz p1, :cond_0

    .line 1077
    const-string v0, "inline"

    iget-object p1, p1, Lcom/flyersoft/components/CSS$Style;->display:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method


# virtual methods
.method public characters([CII)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 3008
    iget-boolean v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->rubyRtStart:Z

    if-eqz v0, :cond_0

    .line 3009
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->rubyRtText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1, p2, p3}, Ljava/lang/String;->copyValueOf([CII)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->rubyRtText:Ljava/lang/String;

    return-void

    .line 3012
    :cond_0
    iget v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->mediaTagStart:I

    if-nez v0, :cond_11

    iget-boolean v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->ignoreStart:Z

    if-nez v0, :cond_11

    iget-object v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->displayNoneTag:Ljava/lang/String;

    if-eqz v0, :cond_1

    goto/16 :goto_5

    .line 3015
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 3016
    iget-object v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->spanBulder:Landroid/text/SpannableStringBuilder;

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    const/4 v4, 0x1

    const/16 v5, 0xa

    if-ge v3, p3, :cond_a

    add-int v6, v3, p2

    .line 3024
    aget-char v6, p1, v6

    .line 3026
    iget-boolean v7, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->preTagStart:Z

    const/16 v8, 0x20

    if-eqz v7, :cond_3

    if-eq v6, v5, :cond_2

    if-ne v6, v8, :cond_3

    .line 3027
    :cond_2
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_3

    :cond_3
    if-eq v6, v8, :cond_6

    if-eq v6, v5, :cond_6

    const/16 v7, 0x9

    if-ne v6, v7, :cond_4

    goto :goto_1

    :cond_4
    const/16 v4, 0x3000

    if-ne v6, v4, :cond_5

    .line 3041
    sget-boolean v4, Lcom/flyersoft/tools/A;->indentParagraph:Z

    if-eqz v4, :cond_5

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-nez v4, :cond_5

    goto :goto_3

    .line 3044
    :cond_5
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 3031
    :cond_6
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-nez v6, :cond_8

    .line 3032
    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v6

    if-nez v6, :cond_7

    const/16 v4, 0xa

    goto :goto_2

    .line 3035
    :cond_7
    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v6

    sub-int/2addr v6, v4

    invoke-virtual {v1, v6}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v4

    goto :goto_2

    .line 3037
    :cond_8
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    sub-int/2addr v6, v4

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v4

    :goto_2
    if-eq v4, v8, :cond_9

    if-eq v4, v5, :cond_9

    .line 3040
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_9
    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 3048
    :cond_a
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    if-lez p1, :cond_11

    .line 3050
    iget p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->floatSpanType:I

    if-gtz p1, :cond_b

    sget-boolean p1, Lcom/flyersoft/tools/A;->trimBlankSpace:Z

    if-eqz p1, :cond_c

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    const/4 p2, 0x5

    if-ge p1, p2, :cond_c

    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p1

    if-lt p1, v4, :cond_c

    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p1

    sub-int/2addr p1, v4

    invoke-virtual {v1, p1}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result p1

    if-ne p1, v5, :cond_c

    :cond_b
    const/4 p1, 0x0

    .line 3052
    :goto_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p2

    if-ge p1, p2, :cond_11

    .line 3053
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result p2

    .line 3054
    invoke-static {p2}, Lcom/flyersoft/tools/A;->isEmptyChar(C)Z

    move-result p2

    if-nez p2, :cond_10

    .line 3061
    :cond_c
    iget-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->savedImgAttributesForNextChar:Lorg/xml/sax/Attributes;

    const/4 p2, 0x0

    if-eqz p1, :cond_e

    .line 3062
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result p1

    if-eq p1, v5, :cond_d

    .line 3063
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->rebuildImageWhileNextCharNotBr()V

    .line 3064
    :cond_d
    iput-object p2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->savedImgAttributesForNextChar:Lorg/xml/sax/Attributes;

    .line 3066
    :cond_e
    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 3067
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v1, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->setBionic(Landroid/text/SpannableStringBuilder;Ljava/lang/String;)V

    .line 3068
    iget p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableStart:I

    const/4 p3, -0x1

    if-eq p1, p3, :cond_f

    .line 3069
    iget-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableList:Ljava/util/ArrayList;

    new-instance p3, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    invoke-direct {p3, p0, v0, p2, v1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;-><init>(Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;Ljava/lang/String;Lorg/xml/sax/Attributes;I)V

    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 3070
    :cond_f
    iput v2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->floatSpanType:I

    return-void

    :cond_10
    add-int/lit8 p1, p1, 0x1

    goto :goto_4

    :cond_11
    :goto_5
    return-void
.end method

.method public convert()Landroid/text/Spanned;
    .locals 13

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 559
    :try_start_0
    iget-object v2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->mReader:Lorg/xml/sax/XMLReader;

    invoke-interface {v2, p0}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 560
    iget-object v2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->mReader:Lorg/xml/sax/XMLReader;

    new-instance v3, Lorg/xml/sax/InputSource;

    new-instance v4, Ljava/io/StringReader;

    iget-object v5, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->mSource:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v4}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/Reader;)V

    invoke-interface {v2, v3}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V

    .line 563
    iget-object v2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->spanBulder:Landroid/text/SpannableStringBuilder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 564
    :try_start_1
    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    const-class v4, Landroid/text/style/ParagraphStyle;

    const/4 v5, 0x0

    invoke-virtual {v2, v5, v3, v4}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v6, 0x0

    .line 568
    :goto_0
    array-length v7, v3

    const/16 v8, 0xa

    if-ge v4, v7, :cond_5

    .line 569
    aget-object v7, v3, v4

    instance-of v9, v7, Lcom/flyersoft/staticlayout/MyMarginSpan;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v9, :cond_2

    .line 571
    :try_start_2
    invoke-virtual {v2, v7}, Landroid/text/SpannableStringBuilder;->getSpanStart(Ljava/lang/Object;)I

    move-result v7

    .line 572
    aget-object v9, v3, v4

    invoke-virtual {v2, v9}, Landroid/text/SpannableStringBuilder;->getSpanEnd(Ljava/lang/Object;)I

    move-result v9

    add-int/lit8 v10, v9, -0x2

    if-ltz v10, :cond_0

    add-int/lit8 v11, v9, -0x1

    .line 576
    invoke-virtual {v2, v11}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v11

    if-ne v11, v8, :cond_0

    invoke-virtual {v2, v10}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v10

    if-ne v10, v8, :cond_0

    add-int/lit8 v9, v9, -0x1

    :cond_0
    if-ne v9, v7, :cond_1

    .line 580
    aget-object v7, v3, v4

    invoke-virtual {v2, v7}, Landroid/text/SpannableStringBuilder;->removeSpan(Ljava/lang/Object;)V

    goto :goto_1

    .line 582
    :cond_1
    aget-object v8, v3, v4

    const/16 v10, 0x33

    invoke-virtual {v2, v8, v7, v9, v10}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    :catch_0
    move-exception v7

    .line 585
    :try_start_3
    invoke-static {v7}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 586
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "obj:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v8, " | "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    new-array v8, v0, [Ljava/lang/Object;

    aput-object v7, v8, v5

    invoke-static {v8}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    goto :goto_1

    .line 589
    :cond_2
    check-cast v7, Lcom/flyersoft/staticlayout/MyMarginSpan;

    .line 590
    iget v8, v7, Lcom/flyersoft/staticlayout/MyMarginSpan;->spEnd:I

    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v9

    if-ne v8, v9, :cond_3

    .line 591
    iget-object v8, v7, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    invoke-static {v8}, Lcom/flyersoft/components/CSS;->hasBorderOrBackgroundColor(Lcom/flyersoft/components/CSS$Style;)Z

    move-result v8

    if-eqz v8, :cond_3

    const/4 v6, 0x1

    .line 594
    :cond_3
    instance-of v8, v7, Lcom/flyersoft/staticlayout/MyFloatSpan;

    if-eqz v8, :cond_4

    move-object v1, v7

    :cond_4
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_5
    if-eqz v1, :cond_8

    .line 600
    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 601
    iget v1, v1, Lcom/flyersoft/staticlayout/MyMarginSpan;->spEnd:I

    invoke-virtual {v3, v8, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    const/4 v4, 0x2

    const/4 v7, -0x1

    if-ne v1, v7, :cond_6

    .line 603
    invoke-virtual {v2, v8}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 604
    invoke-virtual {v2, v8}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    :goto_2
    const/4 v6, 0x2

    goto :goto_3

    :cond_6
    add-int/2addr v1, v0

    .line 607
    invoke-virtual {v3, v8, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    if-ne v1, v7, :cond_7

    .line 609
    invoke-virtual {v2, v8}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    goto :goto_2

    :cond_7
    add-int/2addr v1, v0

    .line 611
    invoke-virtual {v3, v8, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    if-ne v1, v7, :cond_8

    goto :goto_2

    :cond_8
    :goto_3
    const/4 v1, 0x0

    .line 617
    :goto_4
    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_9

    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    sub-int/2addr v3, v0

    invoke-virtual {v2, v3}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lcom/flyersoft/tools/A;->isEmptyChar(C)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 618
    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v1

    sub-int/2addr v1, v0

    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    invoke-virtual {v2, v1, v3}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    const/4 v1, 0x1

    goto :goto_4

    :cond_9
    if-eqz v1, :cond_b

    .line 622
    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v1

    const-class v3, Lcom/flyersoft/staticlayout/MyMarginSpan;

    invoke-virtual {v2, v5, v1, v3}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/flyersoft/staticlayout/MyMarginSpan;

    array-length v3, v1

    :goto_5
    if-ge v5, v3, :cond_b

    aget-object v4, v1, v5

    .line 623
    iget v7, v4, Lcom/flyersoft/staticlayout/MyMarginSpan;->spEnd:I

    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v9

    if-le v7, v9, :cond_a

    .line 624
    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v7

    iput v7, v4, Lcom/flyersoft/staticlayout/MyMarginSpan;->spEnd:I

    :cond_a
    add-int/lit8 v5, v5, 0x1

    goto :goto_5

    :cond_b
    if-lez v6, :cond_c

    .line 626
    invoke-virtual {v2, v8}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_7

    :catchall_0
    move-exception v1

    goto :goto_6

    :catchall_1
    move-exception v2

    move-object v12, v2

    move-object v2, v1

    move-object v1, v12

    .line 629
    :goto_6
    invoke-static {v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 630
    instance-of v3, v1, Ljava/lang/OutOfMemoryError;

    if-eqz v3, :cond_c

    .line 631
    sput-boolean v0, Lcom/flyersoft/tools/A;->tmpOutOfMemoryTag:Z

    .line 632
    invoke-static {v1}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->show_received_message(Ljava/lang/String;)V

    :cond_c
    :goto_7
    return-object v2
.end method

.method public endDocument()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    return-void
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 2832
    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 2833
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleEndTag(Ljava/lang/String;)V

    .line 2835
    iget p2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableStart:I

    const/4 p3, -0x1

    if-eq p2, p3, :cond_1

    .line 2836
    iget-object p2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableList:Ljava/util/ArrayList;

    new-instance v0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {v0, p0, p1, v1, v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;-><init>(Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;Ljava/lang/String;Lorg/xml/sax/Attributes;I)V

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2837
    const-string p2, "table"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 2838
    iget p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableLevel:I

    if-ne p1, v2, :cond_0

    .line 2839
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->dealTableContent()V

    .line 2840
    iput p3, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableStart:I

    .line 2841
    iput-object v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableList:Ljava/util/ArrayList;

    .line 2842
    iput-object v1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableSp:Lcom/flyersoft/staticlayout/MyTableSpan;

    .line 2843
    iget p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableIndexInHtml:I

    add-int/2addr p1, v2

    iput p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableIndexInHtml:I

    .line 2845
    :cond_0
    iget p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableLevel:I

    sub-int/2addr p1, v2

    iput p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableLevel:I

    :cond_1
    return-void
.end method

.method public endPrefixMapping(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    return-void
.end method

.method public ignorableWhitespace([CII)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    return-void
.end method

.method public processingInstruction(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    return-void
.end method

.method public setDocumentLocator(Lorg/xml/sax/Locator;)V
    .locals 0

    return-void
.end method

.method public skippedEntity(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    return-void
.end method

.method public startDocument()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    return-void
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 2815
    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 2816
    invoke-direct {p0, p1, p4}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->handleStartTag(Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 2818
    const-string p2, "table"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 2819
    iget p2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableLevel:I

    if-nez p2, :cond_0

    .line 2820
    iget-object p2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->spanBulder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {p2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p2

    iput p2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableStart:I

    .line 2821
    new-instance p2, Lcom/flyersoft/staticlayout/MyTableSpan;

    invoke-direct {p2}, Lcom/flyersoft/staticlayout/MyTableSpan;-><init>()V

    iput-object p2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableSp:Lcom/flyersoft/staticlayout/MyTableSpan;

    .line 2822
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableList:Ljava/util/ArrayList;

    .line 2824
    :cond_0
    iget p2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableLevel:I

    add-int/lit8 p2, p2, 0x1

    iput p2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableLevel:I

    .line 2825
    iget-object p2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableSp:Lcom/flyersoft/staticlayout/MyTableSpan;

    iget p3, p2, Lcom/flyersoft/staticlayout/MyTableSpan;->level:I

    add-int/lit8 p3, p3, 0x1

    iput p3, p2, Lcom/flyersoft/staticlayout/MyTableSpan;->level:I

    .line 2827
    :cond_1
    iget p2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableStart:I

    const/4 p3, -0x1

    if-eq p2, p3, :cond_2

    .line 2828
    iget-object p2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->tableList:Ljava/util/ArrayList;

    new-instance p3, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;

    const/4 v0, 0x0

    invoke-direct {p3, p0, p1, p4, v0}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;-><init>(Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;Ljava/lang/String;Lorg/xml/sax/Attributes;I)V

    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2
    return-void
.end method

.method public startPrefixMapping(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    return-void
.end method
