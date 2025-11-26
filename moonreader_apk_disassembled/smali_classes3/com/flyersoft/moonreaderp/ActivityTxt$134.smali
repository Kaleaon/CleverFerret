.class Lcom/flyersoft/moonreaderp/ActivityTxt$134;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->do_book_info()V
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

    .line 13460
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$134;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 13463
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$134;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputinfo_sv(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/view/View;)V

    .line 13464
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$134;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputinfo_text(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;)V

    .line 13465
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$134;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputinfo_dlg(Lcom/flyersoft/moonreaderp/ActivityTxt;Lcom/flyersoft/components/MyDialog;)V

    return-void
.end method
