.class Lcom/vladsch/flexmark/formatter/Formatter$1;
.super Ljava/lang/Object;
.source "Formatter.java"

# interfaces
.implements Lcom/vladsch/flexmark/formatter/NodeFormatterFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/formatter/Formatter;-><init>(Lcom/vladsch/flexmark/formatter/Formatter$Builder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/formatter/Formatter;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/formatter/Formatter;)V
    .locals 0

    .line 119
    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/Formatter$1;->this$0:Lcom/vladsch/flexmark/formatter/Formatter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/formatter/NodeFormatter;
    .locals 1

    .line 122
    new-instance v0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-object v0
.end method
