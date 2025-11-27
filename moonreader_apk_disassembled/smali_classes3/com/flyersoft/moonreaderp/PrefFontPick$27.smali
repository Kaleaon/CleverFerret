.class Lcom/flyersoft/moonreaderp/PrefFontPick$27;
.super Ljava/lang/Object;
.source "PrefFontPick.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefDownloadCover$OnSaveImage;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefFontPick;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefFontPick;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 946
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$27;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetImageFile(Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V
    .locals 0

    if-eqz p1, :cond_0

    .line 949
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$27;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    iput-object p1, p2, Lcom/flyersoft/moonreaderp/PrefFontPick;->selectedFont:Ljava/lang/String;

    .line 950
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$27;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefFontPick;->dismiss()V

    :cond_0
    return-void
.end method
