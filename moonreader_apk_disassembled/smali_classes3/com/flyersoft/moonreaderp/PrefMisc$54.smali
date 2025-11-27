.class Lcom/flyersoft/moonreaderp/PrefMisc$54;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->showCssFontOptions(Landroid/app/Dialog;Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$dlg:Landroid/app/Dialog;


# direct methods
.method constructor <init>(Landroid/app/Dialog;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1484
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$54;->val$dlg:Landroid/app/Dialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1487
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$54;->val$dlg:Landroid/app/Dialog;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefFontPick;->showFontsReplacement(Landroid/app/Dialog;)V

    return-void
.end method
