.class public Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListExtension;
.super Ljava/lang/Object;
.source "TaskListExtension.java"

# interfaces
.implements Lcom/vladsch/flexmark/parser/Parser$ParserExtension;
.implements Lcom/vladsch/flexmark/html/HtmlRenderer$HtmlRendererExtension;
.implements Lcom/vladsch/flexmark/formatter/Formatter$FormatterExtension;


# static fields
.field public static final FORMAT_LIST_ITEM_CASE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItemCase;",
            ">;"
        }
    .end annotation
.end field

.field public static final FORMAT_LIST_ITEM_PLACEMENT:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItemPlacement;",
            ">;"
        }
    .end annotation
.end field

.field public static final ITEM_CLASS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final ITEM_DONE_CLASS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final ITEM_DONE_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final ITEM_NOT_DONE_CLASS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final ITEM_NOT_DONE_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOOSE_ITEM_CLASS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final PARAGRAPH_CLASS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final TIGHT_ITEM_CLASS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 28
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "ITEM_DONE_MARKER"

    const-string v2, "<input type=\"checkbox\" class=\"task-list-item-checkbox\" checked=\"checked\" disabled=\"disabled\" readonly=\"readonly\" />&nbsp;"

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListExtension;->ITEM_DONE_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 29
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "ITEM_NOT_DONE_MARKER"

    const-string v2, "<input type=\"checkbox\" class=\"task-list-item-checkbox\" disabled=\"disabled\" readonly=\"readonly\" />&nbsp;"

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListExtension;->ITEM_NOT_DONE_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 30
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "TIGHT_ITEM_CLASS"

    const-string v2, "task-list-item"

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListExtension;->TIGHT_ITEM_CLASS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 32
    new-instance v1, Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey;

    const-string v2, "LOOSE_ITEM_CLASS"

    invoke-direct {v1, v2, v0}, Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey;-><init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/options/DataKey;)V

    sput-object v1, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListExtension;->LOOSE_ITEM_CLASS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 33
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v2, "PARAGRAPH_CLASS"

    const-string v3, ""

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListExtension;->PARAGRAPH_CLASS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 34
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v2, "ITEM_DONE_CLASS"

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListExtension;->ITEM_DONE_CLASS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 35
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v2, "ITEM_NOT_DONE_CLASS"

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListExtension;->ITEM_NOT_DONE_CLASS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 38
    sput-object v0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListExtension;->ITEM_CLASS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 41
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "FORMAT_LIST_ITEM_CASE"

    sget-object v2, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItemCase;->AS_IS:Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItemCase;

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListExtension;->FORMAT_LIST_ITEM_CASE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 42
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "FORMAT_LIST_ITEM_PLACEMENT"

    sget-object v2, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItemPlacement;->AS_IS:Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItemPlacement;

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListExtension;->FORMAT_LIST_ITEM_PLACEMENT:Lcom/vladsch/flexmark/util/options/DataKey;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create()Lcom/vladsch/flexmark/util/builder/Extension;
    .locals 1

    .line 48
    new-instance v0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListExtension;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListExtension;-><init>()V

    return-object v0
.end method


# virtual methods
.method public extend(Lcom/vladsch/flexmark/formatter/Formatter$Builder;)V
    .locals 1

    .line 53
    new-instance v0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListExtension$1;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListExtension$1;-><init>(Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListExtension;)V

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/formatter/Formatter$Builder;->nodeFormatterFactory(Lcom/vladsch/flexmark/formatter/NodeFormatterFactory;)Lcom/vladsch/flexmark/formatter/Formatter$Builder;

    return-void
.end method

.method public extend(Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;Ljava/lang/String;)V
    .locals 0

    .line 78
    const-string p2, "HTML"

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->isRendererType(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 79
    new-instance p2, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$Factory;

    invoke-direct {p2}, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$Factory;-><init>()V

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->nodeRendererFactory(Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;)Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;

    return-void

    .line 80
    :cond_0
    const-string p2, "JIRA"

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->isRendererType(Ljava/lang/String;)Z

    return-void
.end method

.method public extend(Lcom/vladsch/flexmark/parser/Parser$Builder;)V
    .locals 1

    .line 73
    new-instance v0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListItemBlockPreProcessor$Factory;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListItemBlockPreProcessor$Factory;-><init>()V

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/parser/Parser$Builder;->blockPreProcessorFactory(Lcom/vladsch/flexmark/parser/block/BlockPreProcessorFactory;)Lcom/vladsch/flexmark/parser/Parser$Builder;

    return-void
.end method

.method public parserOptions(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)V
    .locals 3

    .line 68
    const-string v0, "[x]"

    const-string v1, "[X]"

    const-string v2, "[ ]"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/vladsch/flexmark/parser/ListOptions;->addItemMarkerSuffixes(Lcom/vladsch/flexmark/util/options/MutableDataHolder;[Ljava/lang/String;)V

    return-void
.end method

.method public rendererOptions(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)V
    .locals 0

    return-void
.end method
