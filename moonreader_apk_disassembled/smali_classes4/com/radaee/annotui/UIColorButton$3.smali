.class Lcom/radaee/annotui/UIColorButton$3;
.super Ljava/lang/Object;
.source "UIColorButton.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/annotui/UIColorButton;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/annotui/UIColorButton;


# direct methods
.method constructor <init>(Lcom/radaee/annotui/UIColorButton;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 72
    iput-object p1, p0, Lcom/radaee/annotui/UIColorButton$3;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 1

    .line 75
    iget-object p1, p0, Lcom/radaee/annotui/UIColorButton$3;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {p1}, Lcom/radaee/annotui/UIColorButton;->access$300(Lcom/radaee/annotui/UIColorButton;)I

    move-result p3

    const v0, -0xff0001

    and-int/2addr p3, v0

    shl-int/lit8 p2, p2, 0x10

    or-int/2addr p2, p3

    invoke-static {p1, p2}, Lcom/radaee/annotui/UIColorButton;->access$302(Lcom/radaee/annotui/UIColorButton;I)I

    .line 76
    iget-object p1, p0, Lcom/radaee/annotui/UIColorButton$3;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {p1}, Lcom/radaee/annotui/UIColorButton;->access$000(Lcom/radaee/annotui/UIColorButton;)Landroid/widget/RelativeLayout;

    move-result-object p1

    iget-object p2, p0, Lcom/radaee/annotui/UIColorButton$3;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {p2}, Lcom/radaee/annotui/UIColorButton;->access$300(Lcom/radaee/annotui/UIColorButton;)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method
