.class Lcom/flyersoft/moonreaderp/PrefFontPick$11;
.super Ljava/lang/Object;
.source "PrefFontPick.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefFontPick;->showFontsReplacement(Landroid/app/Dialog;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$dlg:Landroid/app/Dialog;

.field final synthetic val$replaceLay:Landroid/widget/LinearLayout;


# direct methods
.method constructor <init>(Landroid/app/Dialog;Landroid/widget/LinearLayout;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 389
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$11;->val$dlg:Landroid/app/Dialog;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$11;->val$replaceLay:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 391
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$11;->val$dlg:Landroid/app/Dialog;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$11;->val$replaceLay:Landroid/widget/LinearLayout;

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/PrefFontPick;->-$$Nest$smsaveFontsReplacement(Landroid/app/Dialog;Landroid/widget/LinearLayout;)V

    return-void
.end method
