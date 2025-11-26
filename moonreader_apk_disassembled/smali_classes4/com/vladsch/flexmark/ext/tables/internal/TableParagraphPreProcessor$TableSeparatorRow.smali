.class Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor$TableSeparatorRow;
.super Lcom/vladsch/flexmark/ext/tables/TableRow;
.source "TableParagraphPreProcessor.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ast/DoNotDecorate;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TableSeparatorRow"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 148
    invoke-direct {p0}, Lcom/vladsch/flexmark/ext/tables/TableRow;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 152
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ext/tables/TableRow;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return-void
.end method
