.class Lcom/flyersoft/moonreaderp/PrefMisc$79$1;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc$79;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefMisc$79;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc$79;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1953
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$79$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$79;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1956
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1957
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->replaceBookFile()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/flyersoft/tools/A;->saveNamesRelacement(Ljava/util/ArrayList;Ljava/lang/String;)Z

    .line 1958
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$79$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$79;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc$79;->val$context:Landroid/content/Context;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$79$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$79;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefMisc$79;->val$base:Landroid/widget/LinearLayout;

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smloadReplacesToView(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    return-void
.end method
