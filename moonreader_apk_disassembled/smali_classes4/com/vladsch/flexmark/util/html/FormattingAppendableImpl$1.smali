.class Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$1;
.super Ljava/lang/Object;
.source "FormattingAppendableImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->setPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;

.field final synthetic val$fixedPrefix:Lcom/vladsch/flexmark/util/sequence/CharSubSequence;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;Lcom/vladsch/flexmark/util/sequence/CharSubSequence;)V
    .locals 0

    .line 800
    iput-object p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$1;->this$0:Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;

    iput-object p2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$1;->val$fixedPrefix:Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 803
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$1;->this$0:Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$1;->val$fixedPrefix:Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->access$002(Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method
