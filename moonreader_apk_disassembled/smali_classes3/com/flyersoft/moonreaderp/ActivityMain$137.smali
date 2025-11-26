.class Lcom/flyersoft/moonreaderp/ActivityMain$137;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->showCancelableProgressDialog(Ljava/lang/String;Ljava/lang/String;Z)Landroid/app/ProgressDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 13087
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$137;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    const/4 p1, 0x1

    .line 13089
    sput-boolean p1, Lcom/flyersoft/tools/T;->scanCanceled:Z

    .line 13090
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$137;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p2, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fputstopFileOperation(Lcom/flyersoft/moonreaderp/ActivityMain;Z)V

    return-void
.end method
