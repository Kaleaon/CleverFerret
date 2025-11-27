.class Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$41;
.super Ljava/lang/Object;
.source "CoreNodeFormatter.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->renderAutoLink(Lcom/vladsch/flexmark/ast/DelimitedLinkNode;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/Consumer<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V
    .locals 0

    .line 1076
    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$41;->this$0:Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0

    .line 1076
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$41;->accept(Ljava/lang/String;)V

    return-void
.end method

.method public accept(Ljava/lang/String;)V
    .locals 2

    .line 1079
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$41;->this$0:Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;

    iget-object v0, v0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->myTranslationStore:Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    sget-object v1, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->UNWRAPPED_AUTO_LINKS_MAP:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-void
.end method
