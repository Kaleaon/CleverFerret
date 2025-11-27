.class public Lcom/vladsch/flexmark/ast/util/ReferenceRepository;
.super Lcom/vladsch/flexmark/util/ast/NodeRepository;
.source "ReferenceRepository.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/util/ast/NodeRepository<",
        "Lcom/vladsch/flexmark/ast/Reference;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 21
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->REFERENCES_KEEP:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/KeepType;

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/NodeRepository;-><init>(Lcom/vladsch/flexmark/util/KeepType;)V

    return-void
.end method


# virtual methods
.method public getDataKey()Lcom/vladsch/flexmark/util/options/DataKey;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/ast/util/ReferenceRepository;",
            ">;"
        }
    .end annotation

    .line 26
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->REFERENCES:Lcom/vladsch/flexmark/util/options/DataKey;

    return-object v0
.end method

.method public getKeepDataKey()Lcom/vladsch/flexmark/util/options/DataKey;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/KeepType;",
            ">;"
        }
    .end annotation

    .line 31
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->REFERENCES_KEEP:Lcom/vladsch/flexmark/util/options/DataKey;

    return-object v0
.end method

.method public getReferencedElements(Lcom/vladsch/flexmark/util/ast/Node;)Ljava/util/Set;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ")",
            "Ljava/util/Set<",
            "Lcom/vladsch/flexmark/ast/Reference;",
            ">;"
        }
    .end annotation

    .line 41
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 42
    new-instance v1, Lcom/vladsch/flexmark/ast/util/ReferenceRepository$1;

    invoke-direct {v1, p0, v0}, Lcom/vladsch/flexmark/ast/util/ReferenceRepository$1;-><init>(Lcom/vladsch/flexmark/ast/util/ReferenceRepository;Ljava/util/HashSet;)V

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Class;

    const-class v3, Lcom/vladsch/flexmark/ast/LinkRef;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-class v3, Lcom/vladsch/flexmark/ast/ImageRef;

    const/4 v4, 0x1

    aput-object v3, v2, v4

    invoke-virtual {p0, p1, v1, v2}, Lcom/vladsch/flexmark/ast/util/ReferenceRepository;->visitNodes(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ValueRunnable;[Ljava/lang/Class;)V

    return-object v0
.end method

.method public normalizeKey(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    .line 36
    invoke-static {p1, v0}, Lcom/vladsch/flexmark/util/html/Escaping;->normalizeReference(Ljava/lang/CharSequence;Z)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
