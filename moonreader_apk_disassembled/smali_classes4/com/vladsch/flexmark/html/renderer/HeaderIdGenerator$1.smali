.class Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator$1;
.super Lcom/vladsch/flexmark/ast/util/AnchorRefTargetBlockVisitor;
.source "HeaderIdGenerator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;->generateIds(Lcom/vladsch/flexmark/util/ast/Document;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;)V
    .locals 0

    .line 33
    iput-object p1, p0, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator$1;->this$0:Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;

    invoke-direct {p0}, Lcom/vladsch/flexmark/ast/util/AnchorRefTargetBlockVisitor;-><init>()V

    return-void
.end method


# virtual methods
.method protected visit(Lcom/vladsch/flexmark/ast/AnchorRefTarget;)V
    .locals 2

    .line 36
    invoke-interface {p1}, Lcom/vladsch/flexmark/ast/AnchorRefTarget;->getAnchorRefId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 37
    invoke-interface {p1}, Lcom/vladsch/flexmark/ast/AnchorRefTarget;->getAnchorRefText()Ljava/lang/String;

    move-result-object v0

    .line 40
    iget-object v1, p0, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator$1;->this$0:Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;

    invoke-virtual {v1, v0}, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;->generateId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 43
    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/ast/AnchorRefTarget;->setAnchorRefId(Ljava/lang/String;)V

    :cond_0
    return-void
.end method
