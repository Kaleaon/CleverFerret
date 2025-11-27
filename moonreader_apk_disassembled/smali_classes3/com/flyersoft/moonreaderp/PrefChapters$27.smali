.class Lcom/flyersoft/moonreaderp/PrefChapters$27;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefChapters;->showCnChapterNumOptions()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

.field final synthetic val$dlg:Lcom/flyersoft/components/MyDialog;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters;Lcom/flyersoft/components/MyDialog;)V
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

    .line 2532
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$27;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$27;->val$dlg:Lcom/flyersoft/components/MyDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 2535
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$27;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$27;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->total_pages:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, v0, v1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->show()V

    .line 2536
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$27;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->dismiss()V

    .line 2537
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$27;->val$dlg:Lcom/flyersoft/components/MyDialog;

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->dismiss()V

    return-void
.end method
