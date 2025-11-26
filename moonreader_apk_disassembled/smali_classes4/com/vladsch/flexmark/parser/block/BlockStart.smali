.class public abstract Lcom/vladsch/flexmark/parser/block/BlockStart;
.super Ljava/lang/Object;
.source "BlockStart.java"


# direct methods
.method protected constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static none()Lcom/vladsch/flexmark/parser/block/BlockStart;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public static varargs of([Lcom/vladsch/flexmark/parser/block/BlockParser;)Lcom/vladsch/flexmark/parser/block/BlockStart;
    .locals 1

    .line 18
    new-instance v0, Lcom/vladsch/flexmark/parser/internal/BlockStartImpl;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/parser/internal/BlockStartImpl;-><init>([Lcom/vladsch/flexmark/parser/block/BlockParser;)V

    return-object v0
.end method


# virtual methods
.method public abstract atColumn(I)Lcom/vladsch/flexmark/parser/block/BlockStart;
.end method

.method public abstract atIndex(I)Lcom/vladsch/flexmark/parser/block/BlockStart;
.end method

.method public abstract replaceActiveBlockParser()Lcom/vladsch/flexmark/parser/block/BlockStart;
.end method
