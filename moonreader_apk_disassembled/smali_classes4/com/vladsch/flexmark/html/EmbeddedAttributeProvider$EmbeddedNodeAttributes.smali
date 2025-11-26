.class public Lcom/vladsch/flexmark/html/EmbeddedAttributeProvider$EmbeddedNodeAttributes;
.super Lcom/vladsch/flexmark/util/ast/Node;
.source "EmbeddedAttributeProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/html/EmbeddedAttributeProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "EmbeddedNodeAttributes"
.end annotation


# instance fields
.field final attributes:Lcom/vladsch/flexmark/util/html/Attributes;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/html/Attributes;)V
    .locals 1

    .line 40
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    const/4 v0, 0x0

    invoke-interface {p1, v0, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Node;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 41
    iput-object p2, p0, Lcom/vladsch/flexmark/html/EmbeddedAttributeProvider$EmbeddedNodeAttributes;->attributes:Lcom/vladsch/flexmark/util/html/Attributes;

    return-void
.end method


# virtual methods
.method public astExtraChars(Ljava/lang/StringBuilder;)V
    .locals 0

    return-void
.end method

.method public astString(Ljava/lang/StringBuilder;Z)V
    .locals 1

    .line 51
    const-class v0, Lcom/vladsch/flexmark/html/EmbeddedAttributeProvider$EmbeddedNodeAttributes;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    const-string v0, "["

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/html/EmbeddedAttributeProvider$EmbeddedNodeAttributes;->getStartOffset()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/html/EmbeddedAttributeProvider$EmbeddedNodeAttributes;->getEndOffset()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "]"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    const-string v0, ", attributes: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/vladsch/flexmark/html/EmbeddedAttributeProvider$EmbeddedNodeAttributes;->attributes:Lcom/vladsch/flexmark/util/html/Attributes;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/html/Attributes;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p2, :cond_0

    .line 55
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/html/EmbeddedAttributeProvider$EmbeddedNodeAttributes;->getAstExtra(Ljava/lang/StringBuilder;)V

    :cond_0
    return-void
.end method

.method public getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 46
    sget-object v0, Lcom/vladsch/flexmark/util/ast/Node;->EMPTY_SEGMENTS:[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method
