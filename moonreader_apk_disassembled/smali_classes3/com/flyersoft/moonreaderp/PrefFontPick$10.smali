.class Lcom/flyersoft/moonreaderp/PrefFontPick$10;
.super Ljava/lang/Object;
.source "PrefFontPick.java"

# interfaces
.implements Landroid/content/DialogInterface$OnMultiChoiceClickListener;


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


# direct methods
.method constructor <init>([Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 254
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$10;->val$checked:[Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;IZ)V
    .locals 0

    .line 256
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$10;->val$checked:[Z

    aput-boolean p3, p1, p2

    return-void
.end method
