.class Lcom/flyersoft/moonreaderp/PrefFontPick$9;
.super Ljava/lang/Object;
.source "PrefFontPick.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefFontPick;->showUsedEpubFonts(Landroid/app/Dialog;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$checked:[Z

.field final synthetic val$list:Ljava/util/ArrayList;

.field final synthetic val$originalChecked:[Z


# direct methods
.method constructor <init>([Z[ZLjava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 259
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$9;->val$checked:[Z

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$9;->val$originalChecked:[Z

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$9;->val$list:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 261
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$9;->val$checked:[Z

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$9;->val$originalChecked:[Z

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$9;->val$list:Ljava/util/ArrayList;

    invoke-static {p1, p2, v0}, Lcom/flyersoft/moonreaderp/PrefFontPick;->-$$Nest$smsaveIgnoreFonts([Z[ZLjava/util/ArrayList;)V

    return-void
.end method
