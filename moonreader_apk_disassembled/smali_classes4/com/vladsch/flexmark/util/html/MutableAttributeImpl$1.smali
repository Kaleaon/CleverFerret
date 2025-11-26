.class Lcom/vladsch/flexmark/util/html/MutableAttributeImpl$1;
.super Ljava/lang/Object;
.source "MutableAttributeImpl.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/BiConsumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->setValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/BiConsumer<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;

.field final synthetic val$valueMap:Ljava/util/Map;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;Ljava/util/Map;)V
    .locals 0

    .line 157
    iput-object p1, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl$1;->this$0:Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;

    iput-object p2, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl$1;->val$valueMap:Ljava/util/Map;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 157
    check-cast p1, Ljava/lang/String;

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl$1;->accept(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public accept(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 160
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl$1;->this$0:Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->access$000(Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;)C

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 161
    iget-object p2, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl$1;->val$valueMap:Ljava/util/Map;

    invoke-interface {p2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    .line 163
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl$1;->val$valueMap:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
