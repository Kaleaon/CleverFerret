.class Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;
.super Ljava/lang/Object;
.source "ListBlockParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/core/ListBlockParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ListData"
.end annotation


# instance fields
.field final contentOffset:I

.field final isEmpty:Z

.field final isNumberedList:Z

.field final listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

.field final listMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field final markerColumn:I

.field final markerIndent:I

.field final markerIndex:I

.field final markerSuffix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field final markerSuffixOffset:I


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ast/ListBlock;ZIIIILcom/vladsch/flexmark/util/sequence/BasedSequence;ZLcom/vladsch/flexmark/util/sequence/BasedSequence;I)V
    .locals 0

    .line 582
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 583
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    .line 584
    iput-boolean p2, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->isEmpty:Z

    .line 585
    iput p3, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->markerIndex:I

    .line 586
    iput p4, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->markerColumn:I

    .line 587
    iput p5, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->markerIndent:I

    .line 588
    iput p6, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->contentOffset:I

    .line 589
    iput-object p7, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 590
    iput-boolean p8, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->isNumberedList:Z

    .line 591
    iput-object p9, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->markerSuffix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 592
    iput p10, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->markerSuffixOffset:I

    return-void
.end method
