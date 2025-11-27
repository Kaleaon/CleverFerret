.class Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;
.super Ljava/lang/Object;
.source "MarkdownTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/util/format/MarkdownTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ColumnSpan"
.end annotation


# instance fields
.field additionalWidth:I

.field final columnSpan:I

.field final startColumn:I

.field final width:I


# direct methods
.method public constructor <init>(III)V
    .locals 0

    .line 1329
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1330
    iput p1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;->startColumn:I

    .line 1331
    iput p2, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;->columnSpan:I

    .line 1332
    iput p3, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;->width:I

    const/4 p1, 0x0

    .line 1333
    iput p1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;->additionalWidth:I

    return-void
.end method
