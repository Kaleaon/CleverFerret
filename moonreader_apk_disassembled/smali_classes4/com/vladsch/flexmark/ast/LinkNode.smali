.class public abstract Lcom/vladsch/flexmark/ast/LinkNode;
.super Lcom/vladsch/flexmark/ast/LinkNodeBase;
.source "LinkNode.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ast/DoNotLinkDecorate;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Lcom/vladsch/flexmark/ast/LinkNodeBase;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/LinkNodeBase;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return-void
.end method
