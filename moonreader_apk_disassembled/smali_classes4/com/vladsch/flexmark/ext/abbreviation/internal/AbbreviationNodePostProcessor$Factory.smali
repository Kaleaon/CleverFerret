.class public Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor$Factory;
.super Lcom/vladsch/flexmark/parser/block/NodePostProcessorFactory;
.source "AbbreviationNodePostProcessor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Factory"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 4

    const/4 v0, 0x0

    .line 144
    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/parser/block/NodePostProcessorFactory;-><init>(Z)V

    .line 145
    const-class v1, Lcom/vladsch/flexmark/ast/Text;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Class;

    const-class v3, Lcom/vladsch/flexmark/util/ast/DoNotDecorate;

    aput-object v3, v2, v0

    const-class v0, Lcom/vladsch/flexmark/util/ast/DoNotLinkDecorate;

    const/4 v3, 0x1

    aput-object v0, v2, v3

    invoke-virtual {p0, v1, v2}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor$Factory;->addNodeWithExclusions(Ljava/lang/Class;[Ljava/lang/Class;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic create(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/parser/PostProcessor;
    .locals 0

    .line 135
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor$Factory;->create(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/parser/block/NodePostProcessor;

    move-result-object p1

    return-object p1
.end method

.method public create(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/parser/block/NodePostProcessor;
    .locals 2

    .line 150
    new-instance v0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor;-><init>(Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor$1;)V

    return-object v0
.end method

.method public bridge synthetic create(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 135
    check-cast p1, Lcom/vladsch/flexmark/util/ast/Document;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor$Factory;->create(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/parser/block/NodePostProcessor;

    move-result-object p1

    return-object p1
.end method

.method public getAfterDependents()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "+",
            "Lcom/vladsch/flexmark/parser/PostProcessorFactory;",
            ">;>;"
        }
    .end annotation

    .line 138
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 139
    const-class v1, Lcom/vladsch/flexmark/ext/autolink/internal/AutolinkNodePostProcessor$Factory;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
