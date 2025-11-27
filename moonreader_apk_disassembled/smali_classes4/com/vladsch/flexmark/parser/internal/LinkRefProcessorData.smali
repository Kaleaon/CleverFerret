.class public Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;
.super Ljava/lang/Object;
.source "LinkRefProcessorData.java"


# instance fields
.field public final maxNesting:I

.field public final nestingIndex:[I

.field public final processors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/LinkRefProcessorFactory;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;I[I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/LinkRefProcessorFactory;",
            ">;I[I)V"
        }
    .end annotation

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;->processors:Ljava/util/List;

    .line 14
    iput p2, p0, Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;->maxNesting:I

    .line 15
    iput-object p3, p0, Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;->nestingIndex:[I

    return-void
.end method
