.class Lcom/vladsch/flexmark/util/html/MutableAttributeImpl$2;
.super Ljava/lang/Object;
.source "MutableAttributeImpl.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/BiConsumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->removeValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;
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

.field final synthetic val$removed:[Z

.field final synthetic val$valueMap:Ljava/util/Map;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;Ljava/util/Map;[Z)V
    .locals 0

    .line 209
    iput-object p1, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl$2;->this$0:Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;

    iput-object p2, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl$2;->val$valueMap:Ljava/util/Map;

    iput-object p3, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl$2;->val$removed:[Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 209
    check-cast p1, Ljava/lang/String;

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl$2;->accept(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public accept(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 212
    iget-object p2, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl$2;->val$valueMap:Ljava/util/Map;

    invoke-interface {p2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 213
    iget-object p1, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl$2;->val$removed:[Z

    const/4 p2, 0x0

    const/4 v0, 0x1

    aput-boolean v0, p1, p2

    :cond_0
    return-void
.end method
