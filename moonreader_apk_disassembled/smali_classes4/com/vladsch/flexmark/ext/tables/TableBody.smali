.class public Lcom/vladsch/flexmark/ext/tables/TableBody;
.super Lcom/vladsch/flexmark/util/ast/Node;
.source "TableBody.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/ast/Node;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Node;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return-void
.end method


# virtual methods
.method public getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 12
    sget-object v0, Lcom/vladsch/flexmark/ext/tables/TableBody;->EMPTY_SEGMENTS:[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method
