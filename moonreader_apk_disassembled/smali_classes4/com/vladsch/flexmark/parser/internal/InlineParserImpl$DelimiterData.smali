.class Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$DelimiterData;
.super Ljava/lang/Object;
.source "InlineParserImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DelimiterData"
.end annotation


# instance fields
.field final canClose:Z

.field final canOpen:Z

.field final count:I


# direct methods
.method constructor <init>(IZZ)V
    .locals 0

    .line 1050
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1051
    iput p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$DelimiterData;->count:I

    .line 1052
    iput-boolean p2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$DelimiterData;->canOpen:Z

    .line 1053
    iput-boolean p3, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$DelimiterData;->canClose:Z

    return-void
.end method
