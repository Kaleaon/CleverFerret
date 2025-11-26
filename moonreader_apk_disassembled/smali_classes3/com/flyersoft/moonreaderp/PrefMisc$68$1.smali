.class Lcom/flyersoft/moonreaderp/PrefMisc$68$1;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc$68;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefMisc$68;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc$68;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1752
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$68$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$68;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1755
    invoke-static {}, Lcom/flyersoft/tools/A;->tts_filter_file()Ljava/lang/String;

    move-result-object p1

    const-string p2, ""

    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->saveFileText(Ljava/lang/String;Ljava/lang/String;)Z

    const/4 p1, 0x1

    .line 1756
    invoke-static {p1}, Lcom/flyersoft/tools/A;->initTTSFilters(Z)V

    .line 1757
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$68$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$68;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc$68;->val$context:Landroid/content/Context;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$68$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$68;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefMisc$68;->val$base:Landroid/widget/LinearLayout;

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smloadTtsFilterToView(Landroid/content/Context;Landroid/widget/LinearLayout;)V

    return-void
.end method
