.class Lcom/flyersoft/moonreaderp/ActivityTxt$78;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->showAdjustBrightnessTip()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 7499
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$78;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    const/4 p1, 0x1

    .line 7502
    sput-boolean p1, Lcom/flyersoft/tools/A;->adjustBrightnessTipped:Z

    .line 7503
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$78;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 p2, 0x0

    iput-object p2, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->brightnessDlg:Lcom/flyersoft/components/MyDialog;

    return-void
.end method
