.class public Lcom/vladsch/flexmark/ext/autolink/AutolinkExtension;
.super Ljava/lang/Object;
.source "AutolinkExtension.java"

# interfaces
.implements Lcom/vladsch/flexmark/parser/Parser$ParserExtension;


# static fields
.field public static final IGNORE_LINKS:Lcom/vladsch/flexmark/util/options/DataKey;
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
    .locals 3

    .line 19
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "IGNORE_LINKS"

    const-string v2, ""

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/autolink/AutolinkExtension;->IGNORE_LINKS:Lcom/vladsch/flexmark/util/options/DataKey;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create()Lcom/vladsch/flexmark/util/builder/Extension;
    .locals 1

    .line 26
    new-instance v0, Lcom/vladsch/flexmark/ext/autolink/AutolinkExtension;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ext/autolink/AutolinkExtension;-><init>()V

    return-object v0
.end method


# virtual methods
.method public extend(Lcom/vladsch/flexmark/parser/Parser$Builder;)V
    .locals 1

    .line 35
    new-instance v0, Lcom/vladsch/flexmark/ext/autolink/internal/AutolinkNodePostProcessor$Factory;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ext/autolink/internal/AutolinkNodePostProcessor$Factory;-><init>()V

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/parser/Parser$Builder;->postProcessorFactory(Lcom/vladsch/flexmark/parser/PostProcessorFactory;)Lcom/vladsch/flexmark/parser/Parser$Builder;

    return-void
.end method

.method public parserOptions(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)V
    .locals 0

    return-void
.end method
