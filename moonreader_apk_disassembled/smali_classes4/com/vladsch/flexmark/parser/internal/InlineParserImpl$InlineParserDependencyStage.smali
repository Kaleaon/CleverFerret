.class Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserDependencyStage;
.super Ljava/lang/Object;
.source "InlineParserImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "InlineParserDependencyStage"
.end annotation


# instance fields
.field final dependents:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/InlineParserExtensionFactory;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/InlineParserExtensionFactory;",
            ">;)V"
        }
    .end annotation

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserDependencyStage;->dependents:Ljava/util/List;

    return-void
.end method
