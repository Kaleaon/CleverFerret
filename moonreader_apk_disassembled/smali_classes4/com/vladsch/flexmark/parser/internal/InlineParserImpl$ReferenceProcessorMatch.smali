.class Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$ReferenceProcessorMatch;
.super Ljava/lang/Object;
.source "InlineParserImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ReferenceProcessorMatch"
.end annotation


# instance fields
.field public final nodeChars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field public final processor:Lcom/vladsch/flexmark/parser/LinkRefProcessor;

.field public final wantExclamation:Z


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/parser/LinkRefProcessor;ZLcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 1138
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1139
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$ReferenceProcessorMatch;->processor:Lcom/vladsch/flexmark/parser/LinkRefProcessor;

    .line 1140
    iput-object p3, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$ReferenceProcessorMatch;->nodeChars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 1141
    iput-boolean p2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$ReferenceProcessorMatch;->wantExclamation:Z

    return-void
.end method
