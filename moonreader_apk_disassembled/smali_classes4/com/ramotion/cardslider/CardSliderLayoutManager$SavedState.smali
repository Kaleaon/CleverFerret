.class Lcom/ramotion/cardslider/CardSliderLayoutManager$SavedState;
.super Ljava/lang/Object;
.source "CardSliderLayoutManager.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ramotion/cardslider/CardSliderLayoutManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SavedState"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/ramotion/cardslider/CardSliderLayoutManager$SavedState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field anchorPos:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 97
    new-instance v0, Lcom/ramotion/cardslider/CardSliderLayoutManager$SavedState$1;

    invoke-direct {v0}, Lcom/ramotion/cardslider/CardSliderLayoutManager$SavedState$1;-><init>()V

    sput-object v0, Lcom/ramotion/cardslider/CardSliderLayoutManager$SavedState;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Landroid/os/Parcel;)V
    .locals 0

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager$SavedState;->anchorPos:I

    return-void
.end method

.method public constructor <init>(Lcom/ramotion/cardslider/CardSliderLayoutManager$SavedState;)V
    .locals 0

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    iget p1, p1, Lcom/ramotion/cardslider/CardSliderLayoutManager$SavedState;->anchorPos:I

    iput p1, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager$SavedState;->anchorPos:I

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 94
    iget p2, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager$SavedState;->anchorPos:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
