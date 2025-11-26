.class public Lcom/vladsch/flexmark/html/HtmlRenderer;
.super Ljava/lang/Object;
.source "HtmlRenderer.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/IRender;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;,
        Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencyHandler;,
        Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencies;,
        Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencyStage;,
        Lcom/vladsch/flexmark/html/HtmlRenderer$HtmlRendererExtension;,
        Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;
    }
.end annotation


# static fields
.field public static final ALLOW_LEADING_WHITESPACE:I = 0x20

.field public static final AUTOLINK_WWW_PREFIX:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final CODE_STYLE_HTML_CLOSE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final CODE_STYLE_HTML_OPEN:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final COLLAPSE_WHITESPACE:I = 0x2

.field public static final CONVERT_TABS:I = 0x1

.field public static final DO_NOT_RENDER_LINKS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final EMBEDDED_ATTRIBUTE_PROVIDER:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final EMPHASIS_STYLE_HTML_CLOSE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final EMPHASIS_STYLE_HTML_OPEN:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final ESCAPE_HTML:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final ESCAPE_HTML_BLOCKS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final ESCAPE_HTML_COMMENT_BLOCKS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final ESCAPE_INLINE_HTML:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final ESCAPE_INLINE_HTML_COMMENTS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final FENCED_CODE_LANGUAGE_CLASS_PREFIX:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final FENCED_CODE_NO_LANGUAGE_CLASS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final FORMAT_ALL:I = 0x7

.field public static final FORMAT_ALL_OPTIONS:I = 0x7

.field public static final FORMAT_COLLAPSE_WHITESPACE:I = 0x2

.field public static final FORMAT_CONVERT_TABS:I = 0x1

.field public static final FORMAT_FLAGS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final FORMAT_SUPPRESS_TRAILING_WHITESPACE:I = 0x4

.field public static final GENERATE_HEADER_ID:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final HARD_BREAK:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final HEADER_ID_GENERATOR_NON_ASCII_TO_LOWERCASE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final HEADER_ID_GENERATOR_NON_DASH_CHARS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final HEADER_ID_GENERATOR_NO_DUPED_DASHES:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final HEADER_ID_GENERATOR_RESOLVE_DUPES:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final HEADER_ID_GENERATOR_TO_DASH_CHARS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final HTML_BLOCK_CLOSE_TAG_EOL:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final HTML_BLOCK_OPEN_TAG_EOL:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final INDENT_SIZE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final INLINE_CODE_SPLICE_CLASS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final MAX_TRAILING_BLANK_LINES:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final NO_P_TAGS_USE_BR:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final OBFUSCATE_EMAIL:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final OBFUSCATE_EMAIL_RANDOM:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final PASS_THROUGH:I = 0x10

.field public static final PERCENT_ENCODE_URLS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final PREFIX_AFTER_PENDING_EOL:I = 0x8

.field public static final RECHECK_UNDEFINED_REFERENCES:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final RENDERER_TYPE_EQUIVALENCE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;>;"
        }
    .end annotation
.end field

.field public static final RENDER_HEADER_ID:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final SOFT_BREAK:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final SOURCE_POSITION_ATTRIBUTE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final SOURCE_POSITION_PARAGRAPH_LINES:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final SOURCE_WRAP_HTML:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final SOURCE_WRAP_HTML_BLOCKS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final STRONG_EMPHASIS_STYLE_HTML_CLOSE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final STRONG_EMPHASIS_STYLE_HTML_OPEN:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final SUPPRESSED_LINKS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final SUPPRESS_HTML:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final SUPPRESS_HTML_BLOCKS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final SUPPRESS_HTML_COMMENT_BLOCKS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final SUPPRESS_INLINE_HTML:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final SUPPRESS_INLINE_HTML_COMMENTS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final SUPPRESS_TRAILING_WHITESPACE:I = 0x4

.field public static final TAG_RANGES:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/util/ArrayList<",
            "Lcom/vladsch/flexmark/util/sequence/TagRange;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final TYPE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final UNESCAPE_HTML_ENTITIES:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final attributeProviderFactories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/html/AttributeProviderFactory;",
            ">;"
        }
    .end annotation
.end field

.field private final builder:Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;

.field private final htmlIdGeneratorFactory:Lcom/vladsch/flexmark/html/renderer/HeaderIdGeneratorFactory;

.field private final htmlOptions:Lcom/vladsch/flexmark/html/HtmlRendererOptions;

.field private final linkResolverFactories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/html/LinkResolverFactory;",
            ">;"
        }
    .end annotation
.end field

.field private final nodeRendererFactories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;",
            ">;"
        }
    .end annotation
.end field

.field private final options:Lcom/vladsch/flexmark/util/options/DataHolder;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 36
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "SOFT_BREAK"

    const-string v2, "\n"

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->SOFT_BREAK:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 37
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "HARD_BREAK"

    const-string v2, "<br />\n"

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->HARD_BREAK:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 38
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const/4 v1, 0x0

    move-object v2, v1

    check-cast v2, Ljava/lang/String;

    const-string v2, "STRONG_EMPHASIS_STYLE_HTML_OPEN"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->STRONG_EMPHASIS_STYLE_HTML_OPEN:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 39
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v2, "STRONG_EMPHASIS_STYLE_HTML_CLOSE"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->STRONG_EMPHASIS_STYLE_HTML_CLOSE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 40
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v2, "EMPHASIS_STYLE_HTML_OPEN"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->EMPHASIS_STYLE_HTML_OPEN:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 41
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v2, "EMPHASIS_STYLE_HTML_CLOSE"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->EMPHASIS_STYLE_HTML_CLOSE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 42
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v2, "CODE_STYLE_HTML_OPEN"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->CODE_STYLE_HTML_OPEN:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 43
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v2, "CODE_STYLE_HTML_CLOSE"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->CODE_STYLE_HTML_CLOSE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 44
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v2, "INLINE_CODE_SPLICE_CLASS"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->INLINE_CODE_SPLICE_CLASS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 45
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const/4 v1, 0x0

    .line 46
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 45
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v3, "PERCENT_ENCODE_URLS"

    invoke-direct {v0, v3, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->PERCENT_ENCODE_URLS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 46
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "INDENT_SIZE"

    invoke-direct {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->INDENT_SIZE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 47
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "ESCAPE_HTML"

    invoke-direct {v0, v3, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->ESCAPE_HTML:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 48
    new-instance v3, Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey;

    const-string v4, "ESCAPE_HTML_BLOCKS"

    invoke-direct {v3, v4, v0}, Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey;-><init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/options/DataKey;)V

    sput-object v3, Lcom/vladsch/flexmark/html/HtmlRenderer;->ESCAPE_HTML_BLOCKS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 49
    new-instance v5, Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey;

    const-string v6, "ESCAPE_HTML_COMMENT_BLOCKS"

    invoke-direct {v5, v6, v3}, Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey;-><init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/options/DataKey;)V

    sput-object v5, Lcom/vladsch/flexmark/html/HtmlRenderer;->ESCAPE_HTML_COMMENT_BLOCKS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 50
    new-instance v3, Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey;

    invoke-direct {v3, v4, v0}, Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey;-><init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/options/DataKey;)V

    sput-object v3, Lcom/vladsch/flexmark/html/HtmlRenderer;->ESCAPE_INLINE_HTML:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 51
    new-instance v0, Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey;

    const-string v4, "ESCAPE_INLINE_HTML_COMMENTS"

    invoke-direct {v0, v4, v3}, Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey;-><init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/options/DataKey;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->ESCAPE_INLINE_HTML_COMMENTS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 52
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "SUPPRESS_HTML"

    invoke-direct {v0, v3, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->SUPPRESS_HTML:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 53
    new-instance v3, Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey;

    const-string v4, "SUPPRESS_HTML_BLOCKS"

    invoke-direct {v3, v4, v0}, Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey;-><init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/options/DataKey;)V

    sput-object v3, Lcom/vladsch/flexmark/html/HtmlRenderer;->SUPPRESS_HTML_BLOCKS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 54
    new-instance v4, Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey;

    const-string v5, "SUPPRESS_HTML_COMMENT_BLOCKS"

    invoke-direct {v4, v5, v3}, Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey;-><init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/options/DataKey;)V

    sput-object v4, Lcom/vladsch/flexmark/html/HtmlRenderer;->SUPPRESS_HTML_COMMENT_BLOCKS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 55
    new-instance v3, Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey;

    const-string v4, "SUPPRESS_INLINE_HTML"

    invoke-direct {v3, v4, v0}, Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey;-><init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/options/DataKey;)V

    sput-object v3, Lcom/vladsch/flexmark/html/HtmlRenderer;->SUPPRESS_INLINE_HTML:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 56
    new-instance v0, Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey;

    const-string v4, "SUPPRESS_INLINE_HTML_COMMENTS"

    invoke-direct {v0, v4, v3}, Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey;-><init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/options/DataKey;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->SUPPRESS_INLINE_HTML_COMMENTS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 57
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "SOURCE_WRAP_HTML"

    invoke-direct {v0, v3, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->SOURCE_WRAP_HTML:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 58
    new-instance v3, Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey;

    const-string v4, "SOURCE_WRAP_HTML_BLOCKS"

    invoke-direct {v3, v4, v0}, Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey;-><init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/options/DataKey;)V

    sput-object v3, Lcom/vladsch/flexmark/html/HtmlRenderer;->SOURCE_WRAP_HTML_BLOCKS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 60
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const-string v5, "HEADER_ID_GENERATOR_RESOLVE_DUPES"

    invoke-direct {v0, v5, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->HEADER_ID_GENERATOR_RESOLVE_DUPES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 61
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "HEADER_ID_GENERATOR_TO_DASH_CHARS"

    const-string v6, " -_"

    invoke-direct {v0, v5, v6}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->HEADER_ID_GENERATOR_TO_DASH_CHARS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 62
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "HEADER_ID_GENERATOR_NON_DASH_CHARS"

    const-string v6, ""

    invoke-direct {v0, v5, v6}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->HEADER_ID_GENERATOR_NON_DASH_CHARS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 63
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "HEADER_ID_GENERATOR_NO_DUPED_DASHES"

    invoke-direct {v0, v5, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->HEADER_ID_GENERATOR_NO_DUPED_DASHES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 64
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "HEADER_ID_GENERATOR_NON_ASCII_TO_LOWERCASE"

    invoke-direct {v0, v5, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->HEADER_ID_GENERATOR_NON_ASCII_TO_LOWERCASE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 65
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "RENDER_HEADER_ID"

    invoke-direct {v0, v5, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->RENDER_HEADER_ID:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 66
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "GENERATE_HEADER_ID"

    invoke-direct {v0, v5, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->GENERATE_HEADER_ID:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 67
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "DO_NOT_RENDER_LINKS"

    invoke-direct {v0, v5, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->DO_NOT_RENDER_LINKS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 68
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "FENCED_CODE_LANGUAGE_CLASS_PREFIX"

    const-string v7, "language-"

    invoke-direct {v0, v5, v7}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->FENCED_CODE_LANGUAGE_CLASS_PREFIX:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 69
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "FENCED_CODE_NO_LANGUAGE_CLASS"

    invoke-direct {v0, v5, v6}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->FENCED_CODE_NO_LANGUAGE_CLASS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 70
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "SOURCE_POSITION_ATTRIBUTE"

    invoke-direct {v0, v5, v6}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->SOURCE_POSITION_ATTRIBUTE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 71
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "SOURCE_POSITION_PARAGRAPH_LINES"

    invoke-direct {v0, v5, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->SOURCE_POSITION_PARAGRAPH_LINES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 72
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "TYPE"

    const-string v6, "HTML"

    invoke-direct {v0, v5, v6}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->TYPE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 73
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    new-instance v5, Lcom/vladsch/flexmark/html/HtmlRenderer$1;

    invoke-direct {v5}, Lcom/vladsch/flexmark/html/HtmlRenderer$1;-><init>()V

    const-string v6, "TAG_RANGES"

    invoke-direct {v0, v6, v5}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/collection/DataValueFactory;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->TAG_RANGES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 80
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "RECHECK_UNDEFINED_REFERENCES"

    invoke-direct {v0, v5, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->RECHECK_UNDEFINED_REFERENCES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 81
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "OBFUSCATE_EMAIL"

    invoke-direct {v0, v5, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->OBFUSCATE_EMAIL:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 82
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "OBFUSCATE_EMAIL_RANDOM"

    invoke-direct {v0, v5, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->OBFUSCATE_EMAIL_RANDOM:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 83
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "HTML_BLOCK_OPEN_TAG_EOL"

    invoke-direct {v0, v5, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->HTML_BLOCK_OPEN_TAG_EOL:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 84
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "HTML_BLOCK_CLOSE_TAG_EOL"

    invoke-direct {v0, v5, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->HTML_BLOCK_CLOSE_TAG_EOL:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 85
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "UNESCAPE_HTML_ENTITIES"

    invoke-direct {v0, v5, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->UNESCAPE_HTML_ENTITIES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 87
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "AUTOLINK_WWW_PREFIX"

    const-string v6, "http://"

    invoke-direct {v0, v5, v6}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->AUTOLINK_WWW_PREFIX:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 90
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "SUPPRESSED_LINKS"

    const-string v6, "javascript:.*"

    invoke-direct {v0, v5, v6}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->SUPPRESSED_LINKS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 91
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "NO_P_TAGS_USE_BR"

    invoke-direct {v0, v5, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->NO_P_TAGS_USE_BR:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 92
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "EMBEDDED_ATTRIBUTE_PROVIDER"

    invoke-direct {v0, v1, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->EMBEDDED_ATTRIBUTE_PROVIDER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 97
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "FORMAT_FLAGS"

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->FORMAT_FLAGS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 98
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "MAX_TRAILING_BLANK_LINES"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->MAX_TRAILING_BLANK_LINES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 114
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "RENDERER_TYPE_EQUIVALENCE"

    sget-object v2, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->RENDERER_TYPE_EQUIVALENCE:Lcom/vladsch/flexmark/util/options/DataKey;

    return-void
.end method

.method constructor <init>(Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;)V
    .locals 4

    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 132
    new-instance v0, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;-><init>(Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer;->builder:Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;

    .line 133
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataSet;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/util/options/DataSet;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer;->options:Lcom/vladsch/flexmark/util/options/DataHolder;

    .line 134
    new-instance v1, Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    invoke-direct {v1, v0}, Lcom/vladsch/flexmark/html/HtmlRendererOptions;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object v1, p0, Lcom/vladsch/flexmark/html/HtmlRenderer;->htmlOptions:Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    .line 136
    iget-object v0, p1, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->htmlIdGeneratorFactory:Lcom/vladsch/flexmark/html/renderer/HeaderIdGeneratorFactory;

    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer;->htmlIdGeneratorFactory:Lcom/vladsch/flexmark/html/renderer/HeaderIdGeneratorFactory;

    .line 139
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p1, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->nodeRendererFactories:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 141
    iget-object v1, p1, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->nodeRendererFactories:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_0
    if-ltz v1, :cond_0

    .line 142
    iget-object v2, p1, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->nodeRendererFactories:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;

    .line 145
    new-instance v3, Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;

    invoke-direct {v3, v0, v2}, Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;-><init>(Ljava/util/List;Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 149
    :cond_0
    new-instance v1, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$Factory;

    invoke-direct {v1}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$Factory;-><init>()V

    .line 150
    new-instance v2, Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;

    invoke-direct {v2, v0, v1}, Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;-><init>(Ljava/util/List;Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 152
    new-instance v1, Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencyHandler;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencyHandler;-><init>(Lcom/vladsch/flexmark/html/HtmlRenderer$1;)V

    .line 153
    invoke-virtual {v1, v0}, Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencyHandler;->resolveDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencies;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencies;->getNodeRendererFactories()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer;->nodeRendererFactories:Ljava/util/List;

    .line 156
    iget-object v0, p1, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->attributeProviderFactories:Ljava/util/Map;

    sget-object v1, Lcom/vladsch/flexmark/html/EmbeddedAttributeProvider;->Factory:Lcom/vladsch/flexmark/html/IndependentAttributeProviderFactory;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    .line 157
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p1, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->attributeProviderFactories:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    if-nez v0, :cond_1

    .line 158
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->EMBEDDED_ATTRIBUTE_PROVIDER:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-object v2, p0, Lcom/vladsch/flexmark/html/HtmlRenderer;->options:Lcom/vladsch/flexmark/util/options/DataHolder;

    invoke-virtual {v0, v2}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 160
    sget-object v2, Lcom/vladsch/flexmark/html/EmbeddedAttributeProvider;->Factory:Lcom/vladsch/flexmark/html/IndependentAttributeProviderFactory;

    invoke-interface {v1, v0, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 163
    :cond_1
    invoke-static {v1}, Lcom/vladsch/flexmark/util/dependency/FlatDependencyHandler;->computeDependencies(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer;->attributeProviderFactories:Ljava/util/List;

    .line 164
    iget-object p1, p1, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->linkResolverFactories:Ljava/util/List;

    invoke-static {p1}, Lcom/vladsch/flexmark/util/dependency/FlatDependencyHandler;->computeDependencies(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/html/HtmlRenderer;->linkResolverFactories:Ljava/util/List;

    return-void
.end method

.method static synthetic access$200(Lcom/vladsch/flexmark/html/HtmlRenderer;)Ljava/util/List;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer;->nodeRendererFactories:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$300(Lcom/vladsch/flexmark/html/HtmlRenderer;)Ljava/util/List;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer;->linkResolverFactories:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$400(Lcom/vladsch/flexmark/html/HtmlRenderer;)Lcom/vladsch/flexmark/html/HtmlRendererOptions;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer;->htmlOptions:Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    return-object p0
.end method

.method static synthetic access$500(Lcom/vladsch/flexmark/html/HtmlRenderer;)Lcom/vladsch/flexmark/html/renderer/HeaderIdGeneratorFactory;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer;->htmlIdGeneratorFactory:Lcom/vladsch/flexmark/html/renderer/HeaderIdGeneratorFactory;

    return-object p0
.end method

.method static synthetic access$600(Lcom/vladsch/flexmark/html/HtmlRenderer;)Ljava/util/List;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer;->attributeProviderFactories:Ljava/util/List;

    return-object p0
.end method

.method public static addRenderTypeEquivalence(Lcom/vladsch/flexmark/util/options/MutableDataHolder;Ljava/lang/String;Ljava/lang/String;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 3

    .line 256
    invoke-static {p0, p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer;->isCompatibleRendererType(Lcom/vladsch/flexmark/util/options/MutableDataHolder;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 258
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->RENDERER_TYPE_EQUIVALENCE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p0}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 259
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 260
    new-instance v1, Lcom/vladsch/flexmark/util/Pair;

    invoke-direct {v1, p1, p2}, Lcom/vladsch/flexmark/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 261
    invoke-interface {p0, v0, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    :cond_0
    return-object p0
.end method

.method public static builder()Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;
    .locals 1

    .line 173
    new-instance v0, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;

    invoke-direct {v0}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;-><init>()V

    return-object v0
.end method

.method public static builder(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;
    .locals 1

    .line 183
    new-instance v0, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-object v0
.end method

.method public static isCompatibleRendererType(Lcom/vladsch/flexmark/util/options/MutableDataHolder;Ljava/lang/String;)Z
    .locals 1

    .line 234
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->TYPE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p0}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 235
    invoke-static {p0, v0, p1}, Lcom/vladsch/flexmark/html/HtmlRenderer;->isCompatibleRendererType(Lcom/vladsch/flexmark/util/options/MutableDataHolder;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static isCompatibleRendererType(Lcom/vladsch/flexmark/util/options/MutableDataHolder;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3

    .line 239
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 243
    :cond_0
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->RENDERER_TYPE_EQUIVALENCE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p0}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    .line 245
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/Pair;

    .line 246
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 247
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    return v1

    :cond_2
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public getOptions()Lcom/vladsch/flexmark/util/options/DataHolder;
    .locals 2

    .line 188
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataSet;

    iget-object v1, p0, Lcom/vladsch/flexmark/html/HtmlRenderer;->builder:Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/options/DataSet;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-object v0
.end method

.method public render(Lcom/vladsch/flexmark/util/ast/Node;)Ljava/lang/String;
    .locals 1

    .line 224
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 225
    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/html/HtmlRenderer;->render(Lcom/vladsch/flexmark/util/ast/Node;Ljava/lang/Appendable;)V

    .line 226
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public render(Lcom/vladsch/flexmark/util/ast/Node;Ljava/lang/Appendable;)V
    .locals 8

    .line 198
    new-instance v0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;

    iget-object v1, p0, Lcom/vladsch/flexmark/html/HtmlRenderer;->options:Lcom/vladsch/flexmark/util/options/DataHolder;

    new-instance v2, Lcom/vladsch/flexmark/html/HtmlWriter;

    iget-object v3, p0, Lcom/vladsch/flexmark/html/HtmlRenderer;->htmlOptions:Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    iget v4, v3, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->indentSize:I

    iget-object v3, p0, Lcom/vladsch/flexmark/html/HtmlRenderer;->htmlOptions:Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    iget v5, v3, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->formatFlags:I

    iget-object v3, p0, Lcom/vladsch/flexmark/html/HtmlRenderer;->htmlOptions:Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    iget-boolean v3, v3, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->htmlBlockOpenTagEol:Z

    xor-int/lit8 v6, v3, 0x1

    iget-object v3, p0, Lcom/vladsch/flexmark/html/HtmlRenderer;->htmlOptions:Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    iget-boolean v3, v3, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->htmlBlockCloseTagEol:Z

    xor-int/lit8 v7, v3, 0x1

    move-object v3, p2

    invoke-direct/range {v2 .. v7}, Lcom/vladsch/flexmark/html/HtmlWriter;-><init>(Ljava/lang/Appendable;IIZZ)V

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getDocument()Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object p2

    invoke-direct {v0, p0, v1, v2, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;-><init>(Lcom/vladsch/flexmark/html/HtmlRenderer;Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/html/HtmlWriter;Lcom/vladsch/flexmark/util/ast/Document;)V

    .line 199
    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->render(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 200
    iget-object p1, p0, Lcom/vladsch/flexmark/html/HtmlRenderer;->htmlOptions:Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    iget p1, p1, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->maxTrailingBlankLines:I

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->flush(I)V

    .line 201
    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->dispose()V

    return-void
.end method

.method public render(Lcom/vladsch/flexmark/util/ast/Node;Ljava/lang/Appendable;I)V
    .locals 8

    .line 211
    new-instance v0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;

    iget-object v1, p0, Lcom/vladsch/flexmark/html/HtmlRenderer;->options:Lcom/vladsch/flexmark/util/options/DataHolder;

    new-instance v2, Lcom/vladsch/flexmark/html/HtmlWriter;

    iget-object v3, p0, Lcom/vladsch/flexmark/html/HtmlRenderer;->htmlOptions:Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    iget v4, v3, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->indentSize:I

    iget-object v3, p0, Lcom/vladsch/flexmark/html/HtmlRenderer;->htmlOptions:Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    iget v5, v3, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->formatFlags:I

    iget-object v3, p0, Lcom/vladsch/flexmark/html/HtmlRenderer;->htmlOptions:Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    iget-boolean v3, v3, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->htmlBlockOpenTagEol:Z

    xor-int/lit8 v6, v3, 0x1

    iget-object v3, p0, Lcom/vladsch/flexmark/html/HtmlRenderer;->htmlOptions:Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    iget-boolean v3, v3, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->htmlBlockCloseTagEol:Z

    xor-int/lit8 v7, v3, 0x1

    move-object v3, p2

    invoke-direct/range {v2 .. v7}, Lcom/vladsch/flexmark/html/HtmlWriter;-><init>(Ljava/lang/Appendable;IIZZ)V

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getDocument()Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object p2

    invoke-direct {v0, p0, v1, v2, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;-><init>(Lcom/vladsch/flexmark/html/HtmlRenderer;Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/html/HtmlWriter;Lcom/vladsch/flexmark/util/ast/Document;)V

    .line 212
    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->render(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 213
    invoke-virtual {v0, p3}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->flush(I)V

    .line 214
    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->dispose()V

    return-void
.end method

.method public withOptions(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/html/HtmlRenderer;
    .locals 3

    if-nez p1, :cond_0

    return-object p0

    .line 230
    :cond_0
    new-instance v0, Lcom/vladsch/flexmark/html/HtmlRenderer;

    new-instance v1, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;

    iget-object v2, p0, Lcom/vladsch/flexmark/html/HtmlRenderer;->builder:Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;

    invoke-direct {v1, v2, p1}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;-><init>(Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;Lcom/vladsch/flexmark/util/options/DataHolder;)V

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/html/HtmlRenderer;-><init>(Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;)V

    return-object v0
.end method

.method public bridge synthetic withOptions(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/util/IRender;
    .locals 0

    .line 34
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/html/HtmlRenderer;->withOptions(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/html/HtmlRenderer;

    move-result-object p1

    return-object p1
.end method
