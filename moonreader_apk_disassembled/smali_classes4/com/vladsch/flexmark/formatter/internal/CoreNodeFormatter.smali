.class public Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;
.super Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;
.source "CoreNodeFormatter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter<",
        "Lcom/vladsch/flexmark/ast/util/ReferenceRepository;",
        "Lcom/vladsch/flexmark/ast/Reference;",
        "Lcom/vladsch/flexmark/ast/RefNode;",
        ">;"
    }
.end annotation


# static fields
.field public static final LIST_ITEM_NUMBER:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final LIST_ITEM_SPACING:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/format/options/ListSpacing;",
            ">;"
        }
    .end annotation
.end field

.field public static final UNWRAPPED_AUTO_LINKS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final UNWRAPPED_AUTO_LINKS_MAP:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field static final htmlEntityPlaceholderGenerator:Lcom/vladsch/flexmark/formatter/TranslationPlaceholderGenerator;


# instance fields
.field private blankLines:I

.field private final formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

.field private final listOptions:Lcom/vladsch/flexmark/parser/ListOptions;

.field private final myHtmlBlockPrefix:Ljava/lang/String;

.field myTranslationStore:Lcom/vladsch/flexmark/util/options/MutableDataHolder;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 35
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LIST_ITEM_NUMBER"

    invoke-direct {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->LIST_ITEM_NUMBER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 36
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const/4 v2, 0x0

    move-object v3, v2

    check-cast v3, Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    const-string v3, "LIST_ITEM_SPACING"

    invoke-direct {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->LIST_ITEM_SPACING:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 927
    new-instance v0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$39;

    invoke-direct {v0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$39;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->htmlEntityPlaceholderGenerator:Lcom/vladsch/flexmark/formatter/TranslationPlaceholderGenerator;

    .line 1057
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v2, "UNWRAPPED_AUTO_LINKS"

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->UNWRAPPED_AUTO_LINKS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 1058
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    const-string v2, "UNWRAPPED_AUTO_LINKS_MAP"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->UNWRAPPED_AUTO_LINKS_MAP:Lcom/vladsch/flexmark/util/options/DataKey;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 2

    const/4 v0, 0x0

    .line 45
    invoke-direct {p0, p1, v0}, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/util/options/DataKey;)V

    .line 46
    new-instance v0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    .line 47
    invoke-static {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/parser/ListOptions;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->listOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    const/4 p1, 0x0

    .line 48
    iput p1, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->blankLines:I

    .line 49
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "<"

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, v0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->translationHtmlBlockPrefix:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->myHtmlBlockPrefix:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$100(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/AutoLink;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/AutoLink;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/HtmlBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/HtmlBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/HtmlCommentBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/HtmlCommentBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/HtmlInnerBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/HtmlInnerBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$1300(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/HtmlInnerBlockComment;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/HtmlInnerBlockComment;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/HtmlEntity;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/HtmlEntity;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$1500(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/HtmlInline;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/HtmlInline;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$1600(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/HtmlInlineComment;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/HtmlInlineComment;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$1700(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/Image;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/Image;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$1800(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/ImageRef;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/ImageRef;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$1900(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/IndentedCodeBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/IndentedCodeBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$200(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/util/ast/BlankLine;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/util/ast/BlankLine;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$2000(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/Link;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/Link;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$2100(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/LinkRef;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/LinkRef;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$2200(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/BulletList;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/BulletList;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$2300(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/OrderedList;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/OrderedList;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$2400(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/BulletListItem;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/BulletListItem;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$2500(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/OrderedListItem;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/OrderedListItem;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$2600(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/MailLink;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/MailLink;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$2700(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$2800(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/Reference;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/Reference;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$2900(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/SoftLineBreak;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/SoftLineBreak;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$300(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/BlockQuote;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/BlockQuote;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$3000(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/StrongEmphasis;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/StrongEmphasis;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$3100(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/Text;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/Text;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$3200(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/TextBase;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/TextBase;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$3300(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/ThematicBreak;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/ThematicBreak;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$400(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/Code;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/Code;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$500(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$600(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/Emphasis;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/Emphasis;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$700(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/FencedCodeBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/FencedCodeBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$800(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/HardLineBreak;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/HardLineBreak;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$900(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/Heading;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/Heading;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method public static appendWhiteSpaceBetween(Lcom/vladsch/flexmark/formatter/MarkdownWriter;Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;ZZZ)V
    .locals 0

    if-eqz p2, :cond_1

    if-eqz p1, :cond_1

    if-nez p3, :cond_0

    if-eqz p4, :cond_1

    .line 1124
    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p2}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-static/range {p0 .. p5}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->appendWhiteSpaceBetween(Lcom/vladsch/flexmark/formatter/MarkdownWriter;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;ZZZ)V

    :cond_1
    return-void
.end method

.method public static appendWhiteSpaceBetween(Lcom/vladsch/flexmark/formatter/MarkdownWriter;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;ZZZ)V
    .locals 1

    if-eqz p2, :cond_3

    if-eqz p1, :cond_3

    if-nez p3, :cond_0

    if-eqz p4, :cond_3

    .line 1137
    :cond_0
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result p4

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v0

    if-gt p4, v0, :cond_3

    .line 1138
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result p4

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result p2

    invoke-interface {p1, p4, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    .line 1139
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_3

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isBlank()Z

    move-result p2

    if-eqz p2, :cond_3

    if-nez p3, :cond_2

    if-eqz p5, :cond_1

    .line 1141
    const-string p2, "\r\n"

    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->indexOfAny(Ljava/lang/CharSequence;)I

    move-result p1

    const/4 p2, -0x1

    if-eq p1, p2, :cond_1

    const/16 p1, 0xa

    .line 1142
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(C)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    :cond_1
    const/16 p1, 0x20

    .line 1144
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(C)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    .line 1148
    :cond_2
    invoke-virtual {p0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->getOptions()I

    move-result p2

    or-int/lit8 p3, p2, 0x20

    .line 1149
    invoke-virtual {p0, p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->setOptions(I)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1150
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1151
    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->setOptions(I)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    :cond_3
    return-void
.end method

.method public static getSoftLineBreakSpan(Lcom/vladsch/flexmark/util/ast/Node;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 4

    if-nez p0, :cond_0

    .line 892
    sget-object p0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p0

    .line 895
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    move-object v1, p0

    :goto_0
    if-eqz v0, :cond_1

    .line 897
    instance-of v2, v0, Lcom/vladsch/flexmark/ast/SoftLineBreak;

    if-nez v2, :cond_1

    .line 899
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v1

    move-object v3, v1

    move-object v1, v0

    move-object v0, v3

    goto :goto_0

    :cond_1
    const/4 v0, 0x2

    .line 902
    new-array v0, v0, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    aput-object p0, v0, v2

    const/4 p0, 0x1

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    aput-object v1, v0, p0

    invoke-static {v0}, Lcom/vladsch/flexmark/util/ast/Node;->spanningChars([Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    return-object p0
.end method

.method private render(Lcom/vladsch/flexmark/ast/AutoLink;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 6

    .line 1061
    const-string v4, "hh://"

    const-string v5, ".h"

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v5}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->renderAutoLink(Lcom/vladsch/flexmark/ast/DelimitedLinkNode;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/BlockQuote;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 6

    .line 481
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/BlockQuote;->getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 484
    sget-object v1, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$util$format$options$BlockQuoteMarker:[I

    iget-object v2, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-object v2, v2, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->blockQuoteMarkers:Lcom/vladsch/flexmark/util/format/options/BlockQuoteMarker;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/format/options/BlockQuoteMarker;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const-string v2, "> "

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eq v1, v3, :cond_3

    const/4 v5, 0x2

    if-eq v1, v5, :cond_2

    const/4 v5, 0x3

    if-eq v1, v5, :cond_1

    const/4 v5, 0x4

    if-eq v1, v5, :cond_0

    :goto_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_0
    move-object v0, v2

    goto :goto_0

    :cond_1
    move-object v0, v2

    const/4 v1, 0x1

    goto :goto_1

    .line 490
    :cond_2
    const-string v0, ">"

    goto :goto_0

    .line 486
    :cond_3
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/BlockQuote;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/BlockQuote;->getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v1

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/BlockQuote;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/ast/Node;->getStartOffset()I

    move-result v5

    invoke-interface {v0, v1, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 500
    :goto_1
    iget-object v5, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-boolean v5, v5, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->blockQuoteBlankLines:Z

    if-eqz v5, :cond_4

    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 501
    :cond_4
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->pushPrefix()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 504
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->getPrefix()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    if-eqz v1, :cond_5

    .line 505
    invoke-virtual {v5, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 506
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v3

    invoke-virtual {v5, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    .line 508
    :cond_5
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 512
    :goto_2
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->getOptions()I

    move-result v1

    or-int/lit8 v2, v1, 0x8

    .line 513
    invoke-virtual {p3, v2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->setOptions(I)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 514
    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->setPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 515
    invoke-virtual {p3, v1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->setOptions(I)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 517
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 518
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->popPrefix()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 519
    iget-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-boolean p1, p1, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->blockQuoteBlankLines:Z

    if-eqz p1, :cond_6

    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    :cond_6
    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/BulletList;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 661
    invoke-static {p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->renderList(Lcom/vladsch/flexmark/ast/ListBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/BulletListItem;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 6

    .line 669
    iget-object v3, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->listOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    const-string v4, ""

    const/4 v5, 0x0

    move-object v0, p1

    move-object v1, p2

    move-object v2, p3

    invoke-static/range {v0 .. v5}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->renderListItem(Lcom/vladsch/flexmark/ast/ListItem;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;Lcom/vladsch/flexmark/parser/ListOptions;Ljava/lang/CharSequence;Z)V

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/Code;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 960
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Code;->getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 961
    iget-object p2, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-boolean p2, p2, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->keepSoftLineBreaks:Z

    if-eqz p2, :cond_0

    .line 962
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Code;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendNonTranslating(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    goto :goto_0

    .line 964
    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Code;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-static {p2}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->stripSoftLineBreak(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 966
    :goto_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Code;->getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/Emphasis;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 1

    .line 812
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Emphasis;->getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 813
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 814
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Emphasis;->getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/FencedCodeBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 10

    .line 533
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 535
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    .line 536
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->getClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    const/4 v2, 0x0

    .line 537
    invoke-interface {v0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    .line 538
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v4

    if-lez v4, :cond_0

    invoke-interface {v1, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    .line 539
    :goto_0
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    .line 540
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    .line 542
    sget-object v5, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$util$format$options$CodeFenceMarker:[I

    iget-object v6, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-object v6, v6, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->fencedCodeMarkerType:Lcom/vladsch/flexmark/util/format/options/CodeFenceMarker;

    invoke-virtual {v6}, Lcom/vladsch/flexmark/util/format/options/CodeFenceMarker;->ordinal()I

    move-result v6

    aget v5, v5, v6

    const/4 v6, 0x2

    if-eq v5, v6, :cond_2

    const/4 v6, 0x3

    if-eq v5, v6, :cond_1

    goto :goto_1

    :cond_1
    const/16 v3, 0x7e

    const/16 v4, 0x7e

    goto :goto_1

    :cond_2
    const/16 v3, 0x60

    const/16 v4, 0x60

    .line 555
    :goto_1
    iget-object v5, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget v5, v5, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->fencedCodeMarkerLength:I

    if-ge v0, v5, :cond_3

    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget v0, v0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->fencedCodeMarkerLength:I

    .line 556
    :cond_3
    iget-object v5, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget v5, v5, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->fencedCodeMarkerLength:I

    if-ge v1, v5, :cond_4

    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget v1, v1, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->fencedCodeMarkerLength:I

    .line 558
    :cond_4
    invoke-static {v3}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v0}, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->of(Ljava/lang/CharSequence;I)Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;

    move-result-object v0

    .line 559
    iget-object v3, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-boolean v3, v3, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->fencedCodeMatchClosingMarker:Z

    if-nez v3, :cond_6

    if-nez v4, :cond_5

    goto :goto_2

    .line 560
    :cond_5
    invoke-static {v4}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v1}, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->of(Ljava/lang/CharSequence;I)Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;

    move-result-object v1

    goto :goto_3

    :cond_6
    :goto_2
    move-object v1, v0

    .line 562
    :goto_3
    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 563
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-boolean v0, v0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->fencedCodeSpaceBeforeInfo:Z

    const/16 v3, 0x20

    if-eqz v0, :cond_7

    invoke-virtual {p3, v3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(C)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 564
    :cond_7
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->getInfo()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendNonTranslating(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 565
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->line()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    const/4 v0, 0x1

    .line 567
    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->openPreFormatted(Z)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 568
    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->isTransformingText()Z

    move-result p2

    if-eqz p2, :cond_8

    .line 569
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->getContentChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendNonTranslating(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    goto :goto_6

    .line 571
    :cond_8
    iget-object p2, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-boolean p2, p2, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->fencedCodeMinimizeIndent:Z

    if-eqz p2, :cond_c

    .line 572
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->getContentLines()Ljava/util/List;

    move-result-object p2

    .line 573
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v4

    new-array v4, v4, [I

    .line 576
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    const v6, 0x7fffffff

    const/4 v7, 0x0

    :goto_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_9

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 577
    const-string v9, " \t"

    invoke-interface {v8, v2, v9}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->countLeadingColumns(ILjava/lang/CharSequence;)I

    move-result v8

    aput v8, v4, v7

    .line 578
    filled-new-array {v8}, [I

    move-result-object v8

    invoke-static {v6, v8}, Lcom/vladsch/flexmark/util/Utils;->min(I[I)I

    move-result v6

    add-int/2addr v7, v0

    goto :goto_4

    .line 581
    :cond_9
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-lez v6, :cond_b

    .line 591
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_5
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_d

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 592
    aget v0, v4, v2

    if-le v0, v6, :cond_a

    sub-int/2addr v0, v6

    invoke-virtual {p3, v3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->repeat(CI)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 593
    :cond_a
    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trimStart()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 597
    :cond_b
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->getContentChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    goto :goto_6

    .line 600
    :cond_c
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->getContentChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 603
    :cond_d
    :goto_6
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->closePreFormatted()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 604
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->line()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->line()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 605
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->tailBlankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/HardLineBreak;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 1

    .line 915
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-boolean v0, v0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->keepHardLineBreaks:Z

    if-eqz v0, :cond_1

    .line 916
    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getRenderPurpose()Lcom/vladsch/flexmark/formatter/RenderPurpose;

    move-result-object p2

    sget-object v0, Lcom/vladsch/flexmark/formatter/RenderPurpose;->FORMAT:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    if-ne p2, v0, :cond_0

    .line 917
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HardLineBreak;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    .line 919
    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HardLineBreak;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    .line 921
    :cond_1
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->isPendingSpace()Z

    move-result p1

    if-nez p1, :cond_2

    const/16 p1, 0x20

    .line 923
    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(C)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    :cond_2
    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/Heading;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 4

    .line 425
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 426
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Heading;->isAtxHeading()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_7

    .line 427
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Heading;->getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 428
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-object v0, v0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->spaceAfterAtxMarker:Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

    sget-object v2, Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;->ADD:Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

    const/4 v3, 0x1

    if-eq v0, v2, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-object v0, v0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->spaceAfterAtxMarker:Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

    sget-object v2, Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;->AS_IS:Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

    if-ne v0, v2, :cond_1

    .line 429
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Heading;->getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v0

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Heading;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v2

    if-ge v0, v2, :cond_1

    :cond_0
    const/4 v1, 0x1

    :cond_1
    const/16 v0, 0x20

    if-eqz v1, :cond_2

    .line 431
    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(C)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 433
    :cond_2
    new-instance v2, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$36;

    invoke-direct {v2, p0, p1}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$36;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/Heading;)V

    invoke-interface {p2, p1, v2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->translatingRefTargetSpan(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V

    .line 440
    sget-object p2, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$util$format$options$EqualizeTrailingMarker:[I

    iget-object v2, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-object v2, v2, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->atxHeaderTrailingMarker:Lcom/vladsch/flexmark/util/format/options/EqualizeTrailingMarker;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/format/options/EqualizeTrailingMarker;->ordinal()I

    move-result v2

    aget p2, p2, v2

    if-eq p2, v3, :cond_4

    const/4 v2, 0x2

    if-eq p2, v2, :cond_5

    const/4 v2, 0x3

    if-eq p2, v2, :cond_9

    .line 454
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Heading;->getClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result p2

    if-eqz p2, :cond_9

    if-eqz v1, :cond_3

    .line 455
    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(C)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 456
    :cond_3
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Heading;->getClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    goto :goto_0

    .line 442
    :cond_4
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Heading;->getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNull()Z

    move-result p2

    if-eqz p2, :cond_5

    goto :goto_0

    :cond_5
    if-eqz v1, :cond_6

    .line 445
    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(C)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 446
    :cond_6
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Heading;->getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    goto :goto_0

    .line 461
    :cond_7
    new-instance v0, Lcom/vladsch/flexmark/util/Ref;

    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->offset()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/vladsch/flexmark/util/Ref;-><init>(Ljava/lang/Object;)V

    .line 462
    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->lastOffset(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 463
    new-instance v2, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$37;

    invoke-direct {v2, p0, p1}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$37;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/Heading;)V

    invoke-interface {p2, p1, v2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->translatingRefTargetSpan(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V

    .line 469
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->line()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 471
    iget-object p2, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-boolean p2, p2, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->setextHeaderEqualizeMarker:Z

    if-eqz p2, :cond_8

    .line 472
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Heading;->getClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {p1, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result p1

    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->offset()I

    move-result p2

    iget-object v0, v0, Lcom/vladsch/flexmark/util/Ref;->value:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    sub-int/2addr p2, v0

    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget v0, v0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->minSetextMarkerLength:I

    filled-new-array {v0}, [I

    move-result-object v0

    invoke-static {p2, v0}, Lcom/vladsch/flexmark/util/Utils;->minLimit(I[I)I

    move-result p2

    invoke-virtual {p3, p1, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->repeat(CI)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    goto :goto_0

    .line 474
    :cond_8
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Heading;->getClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 477
    :cond_9
    :goto_0
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->tailBlankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/HtmlBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 2

    .line 970
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HtmlBlock;->hasChildren()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 972
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void

    .line 974
    :cond_0
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 976
    sget-object v0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$formatter$RenderPurpose:[I

    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getRenderPurpose()Lcom/vladsch/flexmark/formatter/RenderPurpose;

    move-result-object p2

    invoke-virtual {p2}, Lcom/vladsch/flexmark/formatter/RenderPurpose;->ordinal()I

    move-result p2

    aget p2, v0, p2

    const/4 v0, 0x1

    if-eq p2, v0, :cond_2

    const/4 v1, 0x2

    if-eq p2, v1, :cond_2

    const/4 v1, 0x3

    if-eq p2, v1, :cond_1

    .line 990
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HtmlBlock;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    goto :goto_0

    .line 983
    :cond_1
    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->openPreFormatted(Z)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 984
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HtmlBlock;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendNonTranslating(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 985
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->closePreFormatted()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    goto :goto_0

    .line 979
    :cond_2
    iget-object p2, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->myHtmlBlockPrefix:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HtmlBlock;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trimEOL()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HtmlBlock;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trimmedEOL()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    const-string v1, ">"

    invoke-virtual {p3, p2, v0, v1, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendNonTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 992
    :goto_0
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/HtmlCommentBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 2

    .line 998
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HtmlCommentBlock;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HtmlCommentBlock;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    const/4 v1, 0x4

    sub-int/2addr v0, v1

    invoke-interface {p2, v1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    .line 999
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HtmlCommentBlock;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trimmedEOL()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    const-string v0, "<!--"

    const-string v1, "-->"

    invoke-virtual {p3, v0, p2, v1, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/HtmlEntity;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 2

    .line 935
    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getRenderPurpose()Lcom/vladsch/flexmark/formatter/RenderPurpose;

    move-result-object v0

    sget-object v1, Lcom/vladsch/flexmark/formatter/RenderPurpose;->FORMAT:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    if-ne v0, v1, :cond_0

    .line 936
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HtmlEntity;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    .line 938
    :cond_0
    sget-object p3, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->htmlEntityPlaceholderGenerator:Lcom/vladsch/flexmark/formatter/TranslationPlaceholderGenerator;

    new-instance v0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$40;

    invoke-direct {v0, p0, p1}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$40;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/HtmlEntity;)V

    invoke-interface {p2, p3, v0}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->customPlaceholderFormat(Lcom/vladsch/flexmark/formatter/TranslationPlaceholderGenerator;Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/HtmlInline;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 1

    .line 1030
    sget-object v0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$formatter$RenderPurpose:[I

    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getRenderPurpose()Lcom/vladsch/flexmark/formatter/RenderPurpose;

    move-result-object p2

    invoke-virtual {p2}, Lcom/vladsch/flexmark/formatter/RenderPurpose;->ordinal()I

    move-result p2

    aget p2, v0, p2

    const/4 v0, 0x1

    if-eq p2, v0, :cond_1

    const/4 v0, 0x2

    if-eq p2, v0, :cond_1

    const/4 v0, 0x3

    if-eq p2, v0, :cond_0

    .line 1043
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HtmlInline;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    .line 1038
    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HtmlInline;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendNonTranslating(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    .line 1033
    :cond_1
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HtmlInline;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    const-string v0, "</"

    invoke-interface {p2, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->startsWith(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_2

    goto :goto_0

    :cond_2
    const-string v0, "<"

    .line 1034
    :goto_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HtmlInline;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    const-string p2, ">"

    invoke-virtual {p3, v0, p1, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendNonTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/HtmlInlineComment;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 1

    .line 1049
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HtmlInlineComment;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HtmlInlineComment;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result p1

    add-int/lit8 p1, p1, -0x3

    const/4 v0, 0x4

    invoke-interface {p2, v0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    .line 1050
    const-string p2, "<!--"

    const-string v0, "-->"

    invoke-virtual {p3, p2, p1, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/HtmlInnerBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 2

    .line 1004
    sget-object v0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$formatter$RenderPurpose:[I

    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getRenderPurpose()Lcom/vladsch/flexmark/formatter/RenderPurpose;

    move-result-object p2

    invoke-virtual {p2}, Lcom/vladsch/flexmark/formatter/RenderPurpose;->ordinal()I

    move-result p2

    aget p2, v0, p2

    const/4 v0, 0x1

    if-eq p2, v0, :cond_1

    const/4 v1, 0x2

    if-eq p2, v1, :cond_1

    const/4 v1, 0x3

    if-eq p2, v1, :cond_0

    .line 1018
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HtmlInnerBlock;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    .line 1011
    :cond_0
    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->openPreFormatted(Z)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1012
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HtmlInnerBlock;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendNonTranslating(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1013
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->closePreFormatted()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    .line 1007
    :cond_1
    iget-object p2, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->myHtmlBlockPrefix:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HtmlInnerBlock;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trimEOL()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HtmlInnerBlock;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trimmedEOL()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    const-string v1, ">"

    invoke-virtual {p3, p2, v0, v1, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendNonTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/HtmlInnerBlockComment;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 1

    .line 1024
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HtmlInnerBlockComment;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HtmlInnerBlockComment;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result p1

    add-int/lit8 p1, p1, -0x3

    const/4 v0, 0x4

    invoke-interface {p2, v0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    .line 1025
    const-string p2, "<!--"

    const-string v0, "-->"

    invoke-virtual {p3, p2, p1, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/Image;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 1

    .line 1161
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-boolean v0, v0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->keepImageLinksAtStart:Z

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->lineIf(Z)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1162
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-boolean v0, v0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->optimizedInlineRendering:Z

    if-eqz v0, :cond_1

    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->isTransformingText()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1186
    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Image;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    .line 1163
    :cond_1
    :goto_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Image;->getTextOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1164
    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->isTransformingText()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1165
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Image;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendTranslating(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    goto :goto_1

    .line 1167
    :cond_2
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 1169
    :goto_1
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Image;->getTextClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1171
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Image;->getLinkOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1173
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Image;->getUrlOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1174
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Image;->getPageRef()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendNonTranslating(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1175
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Image;->getUrlClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1177
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Image;->getTitleOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result p2

    if-eqz p2, :cond_4

    const/16 p2, 0x20

    .line 1178
    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(C)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1179
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Image;->getTitleOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1180
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Image;->getTitle()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result p2

    if-eqz p2, :cond_3

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Image;->getTitle()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendTranslating(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1181
    :cond_3
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Image;->getTitleClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1184
    :cond_4
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Image;->getLinkClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/ImageRef;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 1

    .line 1228
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-boolean v0, v0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->optimizedInlineRendering:Z

    if-eqz v0, :cond_1

    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->isTransformingText()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1250
    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ImageRef;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    .line 1229
    :cond_1
    :goto_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ImageRef;->isReferenceTextCombined()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1230
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ImageRef;->getReferenceOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1231
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ImageRef;->getReference()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendTranslating(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1232
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ImageRef;->getReferenceClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1234
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ImageRef;->getTextOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1235
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ImageRef;->getTextClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    .line 1237
    :cond_2
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ImageRef;->getTextOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1238
    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->isTransformingText()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1239
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ImageRef;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendTranslating(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    goto :goto_1

    .line 1241
    :cond_3
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 1243
    :goto_1
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ImageRef;->getTextClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1245
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ImageRef;->getReferenceOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1246
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ImageRef;->getReference()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendTranslating(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1247
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ImageRef;->getReferenceClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/IndentedCodeBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 8

    .line 609
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 610
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->listOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/ListOptions;->getCodeIndent()I

    move-result v0

    const-string v1, " "

    invoke-static {v1, v0}, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->of(Ljava/lang/CharSequence;I)Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 612
    iget-object v2, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-object v2, v2, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->emulationProfile:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    sget-object v3, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->GITHUB_DOC:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    if-ne v2, v3, :cond_0

    .line 613
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/IndentedCodeBlock;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v2

    instance-of v2, v2, Lcom/vladsch/flexmark/ast/ListItem;

    if-eqz v2, :cond_0

    .line 614
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/IndentedCodeBlock;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/ast/ListItem;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/ast/ListItem;->getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    .line 615
    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    rsub-int/lit8 v0, v0, 0x7

    const/4 v2, 0x4

    filled-new-array {v2}, [I

    move-result-object v2

    invoke-static {v0, v2}, Lcom/vladsch/flexmark/util/Utils;->minLimit(I[I)I

    move-result v0

    invoke-static {v1, v0}, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->of(Ljava/lang/CharSequence;I)Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 619
    :cond_0
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->pushPrefix()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->addPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    const/4 v0, 0x1

    .line 620
    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->openPreFormatted(Z)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 621
    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->isTransformingText()Z

    move-result p2

    if-eqz p2, :cond_1

    .line 622
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/IndentedCodeBlock;->getContentChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendNonTranslating(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    goto :goto_2

    .line 624
    :cond_1
    iget-object p2, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-boolean p2, p2, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->indentedCodeMinimizeIndent:Z

    if-eqz p2, :cond_5

    .line 625
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/IndentedCodeBlock;->getContentLines()Ljava/util/List;

    move-result-object p2

    .line 626
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [I

    .line 629
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v3, 0x0

    const v4, 0x7fffffff

    const/4 v5, 0x0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 630
    const-string v7, " \t"

    invoke-interface {v6, v3, v7}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->countLeadingColumns(ILjava/lang/CharSequence;)I

    move-result v6

    aput v6, v1, v5

    .line 631
    filled-new-array {v6}, [I

    move-result-object v6

    invoke-static {v4, v6}, Lcom/vladsch/flexmark/util/Utils;->min(I[I)I

    move-result v4

    add-int/2addr v5, v0

    goto :goto_0

    :cond_2
    if-lez v4, :cond_4

    .line 643
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_6

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 644
    aget v0, v1, v3

    if-le v0, v4, :cond_3

    const/16 v2, 0x20

    sub-int/2addr v0, v4

    invoke-virtual {p3, v2, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->repeat(CI)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 645
    :cond_3
    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trimStart()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 649
    :cond_4
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/IndentedCodeBlock;->getContentChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    goto :goto_2

    .line 652
    :cond_5
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/IndentedCodeBlock;->getContentChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 655
    :cond_6
    :goto_2
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->closePreFormatted()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 656
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->popPrefix()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 657
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->tailBlankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/Link;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 3

    .line 1191
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-boolean v0, v0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->keepExplicitLinksAtStart:Z

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->lineIf(Z)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1192
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-boolean v0, v0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->optimizedInlineRendering:Z

    if-eqz v0, :cond_1

    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->isTransformingText()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1223
    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Link;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    .line 1193
    :cond_1
    :goto_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Link;->getTextOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1194
    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->isTransformingText()Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Lcom/vladsch/flexmark/ast/HtmlInline;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ast/Link;->getFirstChildAny([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    if-eqz v0, :cond_2

    goto :goto_1

    .line 1197
    :cond_2
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Link;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendTranslating(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    goto :goto_2

    .line 1195
    :cond_3
    :goto_1
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 1199
    :goto_2
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Link;->getTextClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1201
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Link;->getLinkOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1202
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Link;->getUrlOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1203
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Link;->getPageRef()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendNonTranslating(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1205
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Link;->getAnchorMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1207
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Link;->getAnchorRef()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1208
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Link;->getPageRef()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Link;->getAnchorRef()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-interface {p2, v0, v1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->transformAnchorRef(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p2

    .line 1209
    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1212
    :cond_4
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Link;->getUrlClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1214
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Link;->getTitleOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result p2

    if-eqz p2, :cond_6

    const/16 p2, 0x20

    .line 1215
    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(C)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1216
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Link;->getTitleOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1217
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Link;->getTitle()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result p2

    if-eqz p2, :cond_5

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Link;->getTitle()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendTranslating(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1218
    :cond_5
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Link;->getTitleClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1221
    :cond_6
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Link;->getLinkClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/LinkRef;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 12

    .line 1255
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-boolean v0, v0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->optimizedInlineRendering:Z

    if-eqz v0, :cond_1

    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->isTransformingText()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1279
    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/LinkRef;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    .line 1256
    :cond_1
    :goto_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/LinkRef;->isReferenceTextCombined()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1257
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/LinkRef;->getReferenceOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1258
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/LinkRef;->getReferenceOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/LinkRef;->getReference()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v3, 0x1

    move-object v0, p3

    invoke-static/range {v0 .. v5}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->appendWhiteSpaceBetween(Lcom/vladsch/flexmark/formatter/MarkdownWriter;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;ZZZ)V

    .line 1259
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/LinkRef;->getReference()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendTranslating(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1260
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/LinkRef;->getReferenceClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1262
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/LinkRef;->getTextOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1263
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/LinkRef;->getTextClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    :cond_2
    move-object v0, p3

    .line 1265
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/LinkRef;->getTextOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p3

    invoke-virtual {v0, p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1266
    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->isTransformingText()Z

    move-result p3

    if-eqz p3, :cond_4

    const/4 p3, 0x1

    new-array p3, p3, [Ljava/lang/Class;

    const-class v1, Lcom/vladsch/flexmark/ast/HtmlInline;

    const/4 v2, 0x0

    aput-object v1, p3, v2

    invoke-virtual {p1, p3}, Lcom/vladsch/flexmark/ast/LinkRef;->getFirstChildAny([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p3

    if-eqz p3, :cond_3

    goto :goto_1

    .line 1269
    :cond_3
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/LinkRef;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendTranslating(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    goto :goto_2

    .line 1267
    :cond_4
    :goto_1
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 1271
    :goto_2
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/LinkRef;->getTextClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1273
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/LinkRef;->getReferenceOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1274
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/LinkRef;->getReferenceOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v7

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/LinkRef;->getReference()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v8

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v9, 0x1

    move-object v6, v0

    invoke-static/range {v6 .. v11}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->appendWhiteSpaceBetween(Lcom/vladsch/flexmark/formatter/MarkdownWriter;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;ZZZ)V

    .line 1275
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/LinkRef;->getReference()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendTranslating(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1276
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/LinkRef;->getReferenceClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/MailLink;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 6

    const/4 v4, 0x0

    .line 1065
    const-string v5, "@1.h"

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v5}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->renderAutoLink(Lcom/vladsch/flexmark/ast/DelimitedLinkNode;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/OrderedList;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 665
    invoke-static {p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->renderList(Lcom/vladsch/flexmark/ast/ListBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/OrderedListItem;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 6

    .line 673
    iget-object v3, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->listOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    const-string v4, ""

    const/4 v5, 0x0

    move-object v0, p1

    move-object v1, p2

    move-object v2, p3

    invoke-static/range {v0 .. v5}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->renderListItem(Lcom/vladsch/flexmark/ast/ListItem;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;Lcom/vladsch/flexmark/parser/ListOptions;Ljava/lang/CharSequence;Z)V

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 4

    .line 848
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Paragraph;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v0

    instance-of v0, v0, Lcom/vladsch/flexmark/ast/ParagraphContainer;

    if-eqz v0, :cond_4

    .line 849
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Paragraph;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/ast/ParagraphContainer;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/ast/ParagraphContainer;->isParagraphStartWrappingDisabled(Lcom/vladsch/flexmark/ast/Paragraph;)Z

    move-result v0

    .line 850
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Paragraph;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/ast/ParagraphContainer;

    invoke-interface {v1, p1}, Lcom/vladsch/flexmark/ast/ParagraphContainer;->isParagraphEndWrappingDisabled(Lcom/vladsch/flexmark/ast/Paragraph;)Z

    move-result v1

    if-nez v0, :cond_1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 856
    :cond_0
    invoke-static {p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->renderLooseParagraph(Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void

    :cond_1
    :goto_0
    if-nez v0, :cond_2

    .line 852
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 853
    :cond_2
    invoke-static {p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->renderTextBlockParagraphLines(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    if-nez v1, :cond_3

    .line 854
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    :cond_3
    return-void

    .line 859
    :cond_4
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Paragraph;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v0

    instance-of v0, v0, Lcom/vladsch/flexmark/ast/ParagraphItemContainer;

    if-nez v0, :cond_7

    .line 860
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Paragraph;->isTrailingBlankLine()Z

    move-result v0

    if-nez v0, :cond_6

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Paragraph;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    if-eqz v0, :cond_5

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Paragraph;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    instance-of v0, v0, Lcom/vladsch/flexmark/ast/ListBlock;

    if-eqz v0, :cond_6

    .line 861
    :cond_5
    invoke-static {p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->renderTextBlockParagraphLines(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void

    .line 863
    :cond_6
    invoke-static {p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->renderLooseParagraph(Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void

    .line 866
    :cond_7
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Paragraph;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/ast/ParagraphItemContainer;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/ast/ParagraphItemContainer;->isItemParagraph(Lcom/vladsch/flexmark/ast/Paragraph;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 868
    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getDocument()Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object v0

    sget-object v1, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->LIST_ITEM_SPACING:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/ast/Document;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    .line 869
    sget-object v1, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->TIGHT:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    if-ne v0, v1, :cond_8

    .line 870
    invoke-static {p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->renderTextBlockParagraphLines(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void

    .line 871
    :cond_8
    sget-object v1, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->LOOSE:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    if-ne v0, v1, :cond_a

    .line 872
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Paragraph;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Class;

    const-class v2, Lcom/vladsch/flexmark/util/ast/BlankLine;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/ast/Block;->getNextAnyNot([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    if-nez v0, :cond_9

    .line 873
    invoke-static {p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->renderTextBlockParagraphLines(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void

    .line 875
    :cond_9
    invoke-static {p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->renderLooseItemParagraph(Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void

    .line 878
    :cond_a
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Paragraph;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/ast/ParagraphItemContainer;

    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->listOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getOptions()Lcom/vladsch/flexmark/util/options/DataHolder;

    move-result-object v2

    invoke-interface {v0, p1, v1, v2}, Lcom/vladsch/flexmark/ast/ParagraphItemContainer;->isParagraphWrappingDisabled(Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/parser/ListOptions;Lcom/vladsch/flexmark/util/options/DataHolder;)Z

    move-result v0

    if-nez v0, :cond_b

    .line 879
    invoke-static {p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->renderLooseItemParagraph(Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void

    .line 881
    :cond_b
    invoke-static {p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->renderTextBlockParagraphLines(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void

    .line 885
    :cond_c
    invoke-static {p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->renderLooseParagraph(Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/Reference;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 1054
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->renderReference(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/SoftLineBreak;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 906
    iget-object p2, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-boolean p2, p2, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->keepSoftLineBreaks:Z

    if-eqz p2, :cond_0

    .line 907
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/SoftLineBreak;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    .line 908
    :cond_0
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->isPendingSpace()Z

    move-result p1

    if-nez p1, :cond_1

    const/16 p1, 0x20

    .line 910
    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(C)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    :cond_1
    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/StrongEmphasis;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 1

    .line 818
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/StrongEmphasis;->getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 819
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 820
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/StrongEmphasis;->getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/Text;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 948
    iget-object p2, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-boolean p2, p2, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->keepSoftLineBreaks:Z

    if-eqz p2, :cond_0

    .line 949
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Text;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    .line 951
    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Text;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-static {p1}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->stripSoftLineBreak(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/TextBase;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 956
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/ThematicBreak;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 523
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 524
    iget-object p2, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-object p2, p2, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->thematicBreak:Ljava/lang/String;

    if-eqz p2, :cond_0

    .line 525
    iget-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-object p1, p1, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->thematicBreak:Ljava/lang/String;

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    goto :goto_0

    .line 527
    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ThematicBreak;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 529
    :goto_0
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->tailBlankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/util/ast/BlankLine;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 1

    .line 409
    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getDocument()Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object p2

    sget-object v0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->LIST_ITEM_SPACING:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {p2, v0}, Lcom/vladsch/flexmark/util/ast/Document;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p2

    if-nez p2, :cond_1

    .line 410
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/BlankLine;->getPrevious()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/BlankLine;->getPrevious()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    instance-of p1, p1, Lcom/vladsch/flexmark/util/ast/BlankLine;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 411
    iput p1, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->blankLines:I

    .line 413
    :cond_0
    iget p1, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->blankLines:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->blankLines:I

    .line 414
    iget-object p2, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget p2, p2, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->maxBlankLines:I

    if-gt p1, p2, :cond_1

    iget p1, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->blankLines:I

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine(I)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    :cond_1
    return-void
.end method

.method private render(Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 420
    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getTranslationStore()Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object p3

    iput-object p3, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->myTranslationStore:Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 421
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 4

    .line 369
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    .line 370
    instance-of v1, p1, Lcom/vladsch/flexmark/util/ast/Block;

    if-eqz v1, :cond_2

    .line 371
    move-object v1, p1

    check-cast v1, Lcom/vladsch/flexmark/util/ast/Block;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Block;->getContentChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    .line 372
    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 373
    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->prefixOf(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    .line 374
    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 375
    invoke-virtual {p3, v2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 378
    :cond_0
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 379
    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 380
    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->suffixOf(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    .line 381
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_1

    .line 382
    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    :cond_1
    return-void

    .line 386
    :cond_2
    iget-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-boolean p1, p1, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->keepSoftLineBreaks:Z

    if-eqz p1, :cond_3

    .line 387
    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    .line 389
    :cond_3
    invoke-static {v0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->stripSoftLineBreak(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method private renderAutoLink(Lcom/vladsch/flexmark/ast/DelimitedLinkNode;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;Ljava/lang/String;Ljava/lang/String;)V
    .locals 10

    .line 1069
    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->isTransformingText()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1070
    sget-object v0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$formatter$RenderPurpose:[I

    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getRenderPurpose()Lcom/vladsch/flexmark/formatter/RenderPurpose;

    move-result-object p2

    invoke-virtual {p2}, Lcom/vladsch/flexmark/formatter/RenderPurpose;->ordinal()I

    move-result p2

    aget p2, v0, p2

    const/4 v0, 0x1

    const-string v1, ">"

    const-string v2, "<"

    if-eq p2, v0, :cond_3

    const/4 v0, 0x2

    if-eq p2, v0, :cond_2

    const/4 v0, 0x3

    if-eq p2, v0, :cond_0

    .line 1107
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/DelimitedLinkNode;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    .line 1096
    :cond_0
    iget-object p2, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->myTranslationStore:Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    sget-object v0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->UNWRAPPED_AUTO_LINKS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p2, v0}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->myTranslationStore:Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    sget-object v0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->UNWRAPPED_AUTO_LINKS_MAP:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p2, v0}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/HashSet;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/DelimitedLinkNode;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 1097
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/DelimitedLinkNode;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p4, p1, p5}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendNonTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    .line 1099
    :cond_1
    invoke-virtual {p3, v2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1100
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/DelimitedLinkNode;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p4, p1, p5}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendNonTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1101
    invoke-virtual {p3, v1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    .line 1090
    :cond_2
    invoke-virtual {p3, v2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1091
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/DelimitedLinkNode;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p4, p1, p5}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendNonTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1092
    invoke-virtual {p3, v1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    .line 1072
    :cond_3
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/DelimitedLinkNode;->getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNull()Z

    move-result p2

    if-eqz p2, :cond_4

    .line 1074
    iget-object p2, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->myTranslationStore:Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    sget-object v3, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->UNWRAPPED_AUTO_LINKS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p2, v3, v0}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 1075
    invoke-virtual {p3, v2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1076
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/DelimitedLinkNode;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v6

    new-instance v9, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$41;

    invoke-direct {v9, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$41;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    const/4 v8, 0x0

    move-object v4, p3

    move-object v5, p4

    move-object v7, p5

    invoke-virtual/range {v4 .. v9}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendNonTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/Consumer;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1082
    invoke-virtual {v4, v1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    :cond_4
    move-object v4, p3

    move-object v5, p4

    move-object v7, p5

    .line 1084
    invoke-virtual {v4, v2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1085
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/DelimitedLinkNode;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v4, v5, p1, v7}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendNonTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 1086
    invoke-virtual {v4, v1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    :cond_5
    move-object v4, p3

    .line 1111
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/DelimitedLinkNode;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v4, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method public static renderList(Lcom/vladsch/flexmark/ast/ListBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 2

    .line 677
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 678
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/ListBlock;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v1

    :goto_0
    if-eqz v1, :cond_0

    .line 680
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 681
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v1

    goto :goto_0

    .line 683
    :cond_0
    invoke-static {p0, p1, p2, v0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->renderList(Lcom/vladsch/flexmark/ast/ListBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;Ljava/util/List;)V

    return-void
.end method

.method public static renderList(Lcom/vladsch/flexmark/ast/ListBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;Ljava/util/List;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/ast/ListBlock;",
            "Lcom/vladsch/flexmark/formatter/NodeFormatterContext;",
            "Lcom/vladsch/flexmark/formatter/MarkdownWriter;",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;)V"
        }
    .end annotation

    .line 687
    invoke-interface {p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getFormatterOptions()Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    move-result-object v0

    iget-boolean v0, v0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->listAddBlankLineBefore:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    new-array v0, v2, [Ljava/lang/Class;

    const-class v3, Lcom/vladsch/flexmark/ast/ListItem;

    aput-object v3, v0, v1

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/ast/ListBlock;->isOrDescendantOfType([Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 688
    invoke-virtual {p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 691
    :cond_0
    invoke-interface {p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getDocument()Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object v0

    .line 692
    sget-object v3, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->LIST_ITEM_SPACING:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, v3}, Lcom/vladsch/flexmark/util/ast/Document;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    .line 693
    sget-object v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->LIST_ITEM_NUMBER:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, v4}, Lcom/vladsch/flexmark/util/ast/Document;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 694
    instance-of v6, p0, Lcom/vladsch/flexmark/ast/OrderedList;

    if-eqz v6, :cond_1

    move-object v6, p0

    check-cast v6, Lcom/vladsch/flexmark/ast/OrderedList;

    invoke-virtual {v6}, Lcom/vladsch/flexmark/ast/OrderedList;->getStartNumber()I

    move-result v6

    goto :goto_0

    :cond_1
    const/4 v6, 0x1

    :goto_0
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v0, v4, v6}, Lcom/vladsch/flexmark/util/ast/Document;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 697
    sget-object v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$util$format$options$ListSpacing:[I

    invoke-interface {p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getFormatterOptions()Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    move-result-object v6

    iget-object v6, v6, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->listSpacing:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    invoke-virtual {v6}, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->ordinal()I

    move-result v6

    aget v4, v4, v6

    const/4 v6, 0x2

    if-eq v4, v6, :cond_7

    const/4 v6, 0x3

    if-eq v4, v6, :cond_6

    const/4 v6, 0x4

    if-eq v4, v6, :cond_4

    const/4 v6, 0x5

    if-eq v4, v6, :cond_2

    const/4 v4, 0x0

    goto :goto_1

    .line 710
    :cond_2
    sget-object v4, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->LOOSE:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    .line 711
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_8

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/vladsch/flexmark/util/ast/Node;

    .line 712
    instance-of v8, v7, Lcom/vladsch/flexmark/ast/ListItem;

    if-eqz v8, :cond_3

    .line 713
    move-object v8, v7

    check-cast v8, Lcom/vladsch/flexmark/ast/ListItem;

    invoke-virtual {v8}, Lcom/vladsch/flexmark/ast/ListItem;->isOwnTight()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-virtual {v7}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v7

    if-eqz v7, :cond_3

    .line 714
    sget-object v4, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->TIGHT:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    goto :goto_1

    .line 707
    :cond_4
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/ListBlock;->isLoose()Z

    move-result v4

    if-eqz v4, :cond_5

    sget-object v4, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->LOOSE:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    goto :goto_1

    :cond_5
    sget-object v4, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->TIGHT:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    goto :goto_1

    .line 704
    :cond_6
    sget-object v4, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->TIGHT:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    goto :goto_1

    .line 701
    :cond_7
    sget-object v4, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->LOOSE:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    .line 723
    :cond_8
    :goto_1
    sget-object v6, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->LIST_ITEM_SPACING:Lcom/vladsch/flexmark/util/options/DataKey;

    sget-object v7, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->LOOSE:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    if-ne v4, v7, :cond_a

    if-eqz v3, :cond_9

    sget-object v7, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->LOOSE:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    if-ne v3, v7, :cond_a

    :cond_9
    sget-object v7, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->LOOSE:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    goto :goto_2

    :cond_a
    move-object v7, v4

    :goto_2
    invoke-virtual {v0, v6, v7}, Lcom/vladsch/flexmark/util/ast/Document;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 724
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_3
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_d

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vladsch/flexmark/util/ast/Node;

    .line 725
    sget-object v7, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->LOOSE:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    if-ne v4, v7, :cond_c

    if-eqz v3, :cond_b

    sget-object v7, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->LOOSE:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    if-ne v3, v7, :cond_c

    :cond_b
    invoke-virtual {p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 726
    :cond_c
    invoke-interface {p1, v6}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->render(Lcom/vladsch/flexmark/util/ast/Node;)V

    goto :goto_3

    .line 728
    :cond_d
    sget-object p1, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->LIST_ITEM_SPACING:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1, v3}, Lcom/vladsch/flexmark/util/ast/Document;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 729
    sget-object p1, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->LIST_ITEM_NUMBER:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1, v5}, Lcom/vladsch/flexmark/util/ast/Document;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 731
    new-array p1, v2, [Ljava/lang/Class;

    const-class p3, Lcom/vladsch/flexmark/ast/ListItem;

    aput-object p3, p1, v1

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ast/ListBlock;->isOrDescendantOfType([Ljava/lang/Class;)Z

    move-result p0

    if-nez p0, :cond_e

    .line 732
    invoke-virtual {p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    :cond_e
    return-void
.end method

.method public static renderListItem(Lcom/vladsch/flexmark/ast/ListItem;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;Lcom/vladsch/flexmark/parser/ListOptions;Ljava/lang/CharSequence;Z)V
    .locals 10

    .line 743
    invoke-interface {p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getFormatterOptions()Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    move-result-object v0

    .line 745
    iget-boolean v1, v0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->listRemoveEmptyItems:Z

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/ListItem;->hasChildren()Z

    move-result v1

    if-eqz v1, :cond_0

    new-array v1, v3, [Ljava/lang/Class;

    const-class v4, Lcom/vladsch/flexmark/util/ast/BlankLine;

    aput-object v4, v1, v2

    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/ast/ListItem;->getFirstChildAnyNot([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v1

    if-nez v1, :cond_1

    :cond_0
    return-void

    .line 749
    :cond_1
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/ListItem;->getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    .line 750
    instance-of v4, p0, Lcom/vladsch/flexmark/ast/OrderedListItem;

    const/4 v5, 0x3

    const/4 v6, 0x2

    if-eqz v4, :cond_6

    .line 751
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v4

    sub-int/2addr v4, v3

    invoke-interface {v1, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    .line 752
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v7

    sub-int/2addr v7, v3

    invoke-interface {v1, v2, v7}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v1

    .line 754
    sget-object v7, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$util$format$options$ListNumberedMarker:[I

    iget-object v8, v0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->listNumberedMarker:Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;

    invoke-virtual {v8}, Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;->ordinal()I

    move-result v8

    aget v7, v7, v8

    if-eq v7, v3, :cond_4

    if-eq v7, v6, :cond_3

    if-ne v7, v5, :cond_2

    const/16 v4, 0x29

    goto :goto_0

    .line 764
    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Missing case for ListNumberedMarker "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p2, v0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->listNumberedMarker:Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;

    invoke-virtual {p2}, Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;->name()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_3
    const/16 v4, 0x2e

    .line 767
    :cond_4
    :goto_0
    iget-boolean v5, v0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->listRenumberItems:Z

    if-eqz v5, :cond_5

    .line 768
    invoke-interface {p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getDocument()Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object v1

    .line 769
    sget-object v5, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->LIST_ITEM_NUMBER:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v1, v5}, Lcom/vladsch/flexmark/util/ast/Document;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    .line 770
    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v9

    add-int/2addr v9, v3

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-static {v4}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v4

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v7, v6, v2

    aput-object v4, v6, v3

    const-string v4, "%d%c"

    invoke-static {v8, v4, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 771
    invoke-virtual {v1, v5, v9}, Lcom/vladsch/flexmark/util/ast/Document;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-object v1, v4

    goto :goto_1

    .line 773
    :cond_5
    invoke-static {v4}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v4

    new-array v5, v6, [Ljava/lang/Object;

    aput-object v1, v5, v2

    aput-object v4, v5, v3

    const-string v1, "%s%c"

    invoke-static {v1, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 776
    :cond_6
    sget-object v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$util$format$options$ListBulletMarker:[I

    iget-object v7, v0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->listBulletMarker:Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;

    invoke-virtual {v7}, Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;->ordinal()I

    move-result v7

    aget v4, v4, v7

    if-eq v4, v3, :cond_a

    if-eq v4, v6, :cond_9

    if-eq v4, v5, :cond_8

    const/4 v1, 0x4

    if-ne v4, v1, :cond_7

    .line 787
    const-string v1, "+"

    goto :goto_1

    .line 789
    :cond_7
    new-instance p0, Ljava/lang/IllegalStateException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Missing case for ListBulletMarker "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p2, v0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->listBulletMarker:Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;

    invoke-virtual {p2}, Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;->name()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 784
    :cond_8
    const-string v1, "*"

    goto :goto_1

    .line 781
    :cond_9
    const-string v1, "-"

    .line 792
    :cond_a
    :goto_1
    invoke-virtual {p2, v1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object v4

    const/16 v5, 0x20

    invoke-virtual {v4, v5}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(C)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object v4

    invoke-virtual {v4, p4}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 793
    invoke-virtual {p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->pushPrefix()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object v4

    iget-boolean v0, v0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->itemContentIndent:Z

    if-eqz v0, :cond_c

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    invoke-virtual {p3}, Lcom/vladsch/flexmark/parser/ListOptions;->isItemContentAfterSuffix()Z

    move-result p3

    if-eqz p3, :cond_b

    invoke-interface {p4}, Ljava/lang/CharSequence;->length()I

    move-result p3

    goto :goto_2

    :cond_b
    const/4 p3, 0x0

    :goto_2
    add-int/2addr v0, p3

    add-int/2addr v0, v3

    invoke-static {v5, v0}, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->of(CI)Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;

    move-result-object p3

    goto :goto_3

    :cond_c
    const-string p4, " "

    .line 794
    invoke-virtual {p3}, Lcom/vladsch/flexmark/parser/ListOptions;->getItemIndent()I

    move-result p3

    invoke-static {p4, p3}, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->of(Ljava/lang/CharSequence;I)Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;

    move-result-object p3

    invoke-virtual {p3}, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->toString()Ljava/lang/String;

    move-result-object p3

    .line 793
    :goto_3
    invoke-virtual {v4, p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->addPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 796
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/ListItem;->hasChildren()Z

    move-result p3

    if-eqz p3, :cond_e

    new-array p3, v3, [Ljava/lang/Class;

    const-class p4, Lcom/vladsch/flexmark/util/ast/BlankLine;

    aput-object p4, p3, v2

    invoke-virtual {p0, p3}, Lcom/vladsch/flexmark/ast/ListItem;->getFirstChildAnyNot([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p3

    if-eqz p3, :cond_e

    .line 797
    invoke-interface {p1, p0}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    if-eqz p5, :cond_10

    .line 798
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/ListItem;->isLoose()Z

    move-result p1

    if-nez p1, :cond_d

    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/ListItem;->getDocument()Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object p0

    sget-object p1, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->LIST_ITEM_SPACING:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/ast/Document;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->LOOSE:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    if-ne p0, p1, :cond_10

    .line 799
    :cond_d
    invoke-virtual {p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    goto :goto_4

    .line 802
    :cond_e
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/ListItem;->isLoose()Z

    move-result p0

    if-eqz p0, :cond_f

    .line 803
    invoke-virtual {p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    goto :goto_4

    .line 805
    :cond_f
    invoke-virtual {p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->addLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 808
    :cond_10
    :goto_4
    invoke-virtual {p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->popPrefix()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method public static renderLooseItemParagraph(Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 843
    invoke-static {p0, p1, p2}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->renderTextBlockParagraphLines(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    .line 844
    invoke-virtual {p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->tailBlankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method public static renderLooseParagraph(Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 836
    invoke-virtual {p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 837
    invoke-static {p0, p1, p2}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->renderTextBlockParagraphLines(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    .line 838
    invoke-virtual {p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->tailBlankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method public static renderTextBlockParagraphLines(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 1

    .line 825
    new-instance v0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$38;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$38;-><init>(Lcom/vladsch/flexmark/util/ast/Node;)V

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->translatingSpan(Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V

    .line 831
    invoke-virtual {p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->line()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method private static stripSoftLineBreak(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 3

    .line 396
    const-string v0, "\\s*(?:\r\n|\r|\n)\\s*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    const/4 v1, 0x0

    .line 397
    :goto_0
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_1

    if-nez v1, :cond_0

    .line 398
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 399
    :cond_0
    const-string v2, " "

    invoke-virtual {v0, v1, v2}, Ljava/util/regex/Matcher;->appendReplacement(Ljava/lang/StringBuffer;Ljava/lang/String;)Ljava/util/regex/Matcher;

    goto :goto_0

    :cond_1
    if-eqz v1, :cond_2

    .line 402
    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->appendTail(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    return-object v1

    :cond_2
    return-object p0
.end method


# virtual methods
.method public getNodeClasses()Ljava/util/Set;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "*>;>;"
        }
    .end annotation

    .line 54
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-object v0, v0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->referencePlacement:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    sget-object v1, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;->AS_IS:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-object v0, v0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->referenceSort:Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;

    sget-object v1, Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;->SORT_UNUSED_LAST:Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 56
    :cond_0
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Class;

    const-class v2, Lcom/vladsch/flexmark/ast/RefNode;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getNodeFormattingHandlers()Ljava/util/Set;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/vladsch/flexmark/formatter/NodeFormattingHandler<",
            "*>;>;"
        }
    .end annotation

    .line 158
    new-instance v0, Ljava/util/HashSet;

    const/16 v1, 0x22

    new-array v1, v1, [Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/util/ast/Node;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$2;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$2;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/AutoLink;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$3;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$3;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/4 v3, 0x1

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/util/ast/BlankLine;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$4;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$4;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/4 v3, 0x2

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/BlockQuote;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$5;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$5;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/4 v3, 0x3

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/Code;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$6;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$6;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/4 v3, 0x4

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/util/ast/Document;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$7;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$7;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/4 v3, 0x5

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/Emphasis;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$8;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$8;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/4 v3, 0x6

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/FencedCodeBlock;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$9;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$9;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/4 v3, 0x7

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/HardLineBreak;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$10;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$10;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/16 v3, 0x8

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/Heading;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$11;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$11;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/16 v3, 0x9

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/HtmlBlock;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$12;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$12;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/16 v3, 0xa

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/HtmlCommentBlock;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$13;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$13;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/16 v3, 0xb

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/HtmlInnerBlock;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$14;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$14;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/16 v3, 0xc

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/HtmlInnerBlockComment;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$15;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$15;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/16 v3, 0xd

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/HtmlEntity;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$16;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$16;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/16 v3, 0xe

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/HtmlInline;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$17;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$17;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/16 v3, 0xf

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/HtmlInlineComment;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$18;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$18;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/16 v3, 0x10

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/Image;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$19;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$19;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/16 v3, 0x11

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/ImageRef;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$20;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$20;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/16 v3, 0x12

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/IndentedCodeBlock;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$21;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$21;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/16 v3, 0x13

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/Link;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$22;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$22;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/16 v3, 0x14

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/LinkRef;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$23;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$23;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/16 v3, 0x15

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/BulletList;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$24;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$24;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/16 v3, 0x16

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/OrderedList;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$25;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$25;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/16 v3, 0x17

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/BulletListItem;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$26;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$26;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/16 v3, 0x18

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/OrderedListItem;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$27;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$27;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/16 v3, 0x19

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/MailLink;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$28;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$28;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/16 v3, 0x1a

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/Paragraph;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$29;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$29;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/16 v3, 0x1b

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/Reference;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$30;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$30;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/16 v3, 0x1c

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/SoftLineBreak;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$31;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$31;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/16 v3, 0x1d

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/StrongEmphasis;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$32;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$32;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/16 v3, 0x1e

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/Text;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$33;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$33;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/16 v3, 0x1f

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/TextBase;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$34;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$34;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/16 v3, 0x20

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/ThematicBreak;

    new-instance v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$35;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$35;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/16 v3, 0x21

    aput-object v2, v1, v3

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getReferencePlacement()Lcom/vladsch/flexmark/util/format/options/ElementPlacement;
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-object v0, v0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->referencePlacement:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    return-object v0
.end method

.method public getReferenceSort()Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-object v0, v0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->referenceSort:Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;

    return-object v0
.end method

.method public getRepository(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/ast/util/ReferenceRepository;
    .locals 1

    .line 63
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->REFERENCES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/ast/util/ReferenceRepository;

    return-object p1
.end method

.method public bridge synthetic getRepository(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/util/ast/NodeRepository;
    .locals 0

    .line 33
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->getRepository(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/ast/util/ReferenceRepository;

    move-result-object p1

    return-object p1
.end method

.method public renderDocument(Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/formatter/FormattingPhase;)V
    .locals 4

    .line 110
    invoke-super {p0, p1, p2, p3, p4}, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->renderDocument(Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/formatter/FormattingPhase;)V

    .line 112
    sget-object v0, Lcom/vladsch/flexmark/formatter/FormattingPhase;->DOCUMENT_BOTTOM:Lcom/vladsch/flexmark/formatter/FormattingPhase;

    if-ne p4, v0, :cond_5

    .line 113
    invoke-interface {p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getFormatterOptions()Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    move-result-object p4

    iget-boolean p4, p4, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->appendTransferredReferences:Z

    if-eqz p4, :cond_5

    .line 115
    new-instance p4, Ljava/util/ArrayList;

    invoke-direct {p4}, Ljava/util/ArrayList;-><init>()V

    .line 117
    invoke-virtual {p3}, Lcom/vladsch/flexmark/util/ast/Document;->getAll()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/options/DataKey;

    .line 118
    invoke-virtual {p3, v1}, Lcom/vladsch/flexmark/util/ast/Document;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Lcom/vladsch/flexmark/util/ast/NodeRepository;

    if-eqz v2, :cond_0

    .line 119
    invoke-virtual {p4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 123
    :cond_1
    new-instance v0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$1;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$1;-><init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V

    invoke-static {p4, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 132
    invoke-virtual {p4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p4

    const/4 v0, 0x1

    :cond_2
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/options/DataKey;

    .line 133
    invoke-virtual {p3, v1}, Lcom/vladsch/flexmark/util/ast/Document;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Lcom/vladsch/flexmark/util/ast/NodeRepository;

    if-eqz v2, :cond_2

    .line 134
    invoke-virtual {v1, p3}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/ast/NodeRepository;

    .line 135
    invoke-virtual {v1, p3}, Lcom/vladsch/flexmark/util/ast/NodeRepository;->getReferencedElements(Lcom/vladsch/flexmark/util/ast/Node;)Ljava/util/Set;

    move-result-object v1

    .line 137
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_3
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 138
    instance-of v3, v2, Lcom/vladsch/flexmark/util/ast/Node;

    if-eqz v3, :cond_3

    .line 139
    check-cast v2, Lcom/vladsch/flexmark/util/ast/Node;

    .line 140
    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/ast/Node;->getDocument()Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object v3

    if-eq v3, p3, :cond_3

    if-eqz v0, :cond_4

    .line 144
    invoke-virtual {p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    const/4 v0, 0x0

    .line 146
    :cond_4
    invoke-interface {p1, v2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->render(Lcom/vladsch/flexmark/util/ast/Node;)V

    goto :goto_1

    :cond_5
    return-void
.end method

.method public renderReferenceBlock(Lcom/vladsch/flexmark/ast/Reference;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 3

    .line 78
    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->isTransformingText()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 79
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Reference;->getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 80
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Reference;->getReference()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendTranslating(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 81
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Reference;->getClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    const/16 v0, 0x20

    .line 83
    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(C)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 85
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Reference;->getUrlOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {p3, v1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 86
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Reference;->getPageRef()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {p3, v1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendNonTranslating(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 88
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Reference;->getAnchorMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {p3, v1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 89
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Reference;->getAnchorRef()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 90
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Reference;->getPageRef()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Reference;->getAnchorRef()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-interface {p2, v1, v2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->transformAnchorRef(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p2

    .line 91
    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 93
    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Reference;->getUrlClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 95
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Reference;->getTitleOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result p2

    if-eqz p2, :cond_2

    .line 96
    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(C)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 97
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Reference;->getTitleOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 98
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Reference;->getTitle()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Reference;->getTitle()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendTranslating(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 99
    :cond_1
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Reference;->getTitleClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 102
    :cond_2
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Reference;->getUrlClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->line()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    .line 104
    :cond_3
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Reference;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->line()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method public bridge synthetic renderReferenceBlock(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 33
    check-cast p1, Lcom/vladsch/flexmark/ast/Reference;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->renderReferenceBlock(Lcom/vladsch/flexmark/ast/Reference;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method
