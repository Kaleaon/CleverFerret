.class Lcom/flyersoft/moonreaderp/ActivityTxt$176;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->showCssMissedFontsTip()Z
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

    .line 17854
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$176;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 17857
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$176;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetcssFontDlg(Lcom/flyersoft/moonreaderp/ActivityTxt;)Landroidx/appcompat/app/AlertDialog;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefFontPick;->showFontsReplacement(Landroid/app/Dialog;)V

    return-void
.end method
