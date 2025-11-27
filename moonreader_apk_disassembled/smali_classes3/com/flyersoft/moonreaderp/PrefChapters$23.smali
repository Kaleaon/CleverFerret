.class Lcom/flyersoft/moonreaderp/PrefChapters$23;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefChapters;->createProgressDlg(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefChapters;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 2097
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$23;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 2099
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$23;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-boolean p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->dismissed:Z

    if-nez p1, :cond_0

    .line 2100
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$23;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$mhideSystemNavigation(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    .line 2101
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$23;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    const/4 v0, 0x0

    iput-object v0, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->progressDlg:Landroid/app/ProgressDialog;

    return-void
.end method
