.class Lcom/flyersoft/moonreaderp/misc/FuncSearch$2$1;
.super Ljava/lang/Object;
.source "FuncSearch.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/misc/FuncSearch$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/misc/FuncSearch$2;

.field final synthetic val$original:Ljava/lang/CharSequence;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/misc/FuncSearch$2;Ljava/lang/CharSequence;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 313
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/misc/FuncSearch$2$1;->this$0:Lcom/flyersoft/moonreaderp/misc/FuncSearch$2;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/misc/FuncSearch$2$1;->val$original:Ljava/lang/CharSequence;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 315
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/misc/FuncSearch$2$1;->this$0:Lcom/flyersoft/moonreaderp/misc/FuncSearch$2;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch$2;->val$target:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/misc/FuncSearch$2$1;->val$original:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
