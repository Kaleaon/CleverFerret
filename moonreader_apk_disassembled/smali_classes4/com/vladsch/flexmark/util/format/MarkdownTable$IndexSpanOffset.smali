.class public Lcom/vladsch/flexmark/util/format/MarkdownTable$IndexSpanOffset;
.super Ljava/lang/Object;
.source "MarkdownTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/util/format/MarkdownTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "IndexSpanOffset"
.end annotation


# instance fields
.field public final index:I

.field public final spanOffset:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 1452
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1453
    iput p1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$IndexSpanOffset;->index:I

    .line 1454
    iput p2, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$IndexSpanOffset;->spanOffset:I

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1459
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "IndexSpanOffset{index="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$IndexSpanOffset;->index:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", spanOffset="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$IndexSpanOffset;->spanOffset:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
