.class Lcom/flyersoft/moonreaderp/PrefStatusSetting$19;
.super Ljava/lang/Object;
.source "PrefStatusSetting.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefStatusSetting;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 408
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting$19;->this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getColor(I)V
    .locals 2

    .line 410
    sget v0, Lcom/flyersoft/tools/A;->statusFontColor:I

    if-eq p1, v0, :cond_0

    .line 411
    sput p1, Lcom/flyersoft/tools/A;->statusFontColor:I

    .line 412
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting$19;->this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->fontColorIv:Lcom/google/android/material/imageview/ShapeableImageView;

    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    sget v1, Lcom/flyersoft/tools/A;->statusFontColor:I

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p1, v0}, Lcom/google/android/material/imageview/ShapeableImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 413
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting$19;->this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->-$$Nest$mupdateStatusBarProperties(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    :cond_0
    return-void
.end method
