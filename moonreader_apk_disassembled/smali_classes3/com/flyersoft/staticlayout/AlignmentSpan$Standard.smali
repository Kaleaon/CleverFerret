.class public Lcom/flyersoft/staticlayout/AlignmentSpan$Standard;
.super Ljava/lang/Object;
.source "AlignmentSpan.java"

# interfaces
.implements Lcom/flyersoft/staticlayout/AlignmentSpan;
.implements Landroid/text/ParcelableSpan;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/staticlayout/AlignmentSpan;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Standard"
.end annotation


# instance fields
.field private final mAlignment:Lcom/flyersoft/staticlayout/MyLayout$Alignment;


# direct methods
.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/staticlayout/MyLayout$Alignment;->valueOf(Ljava/lang/String;)Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/staticlayout/AlignmentSpan$Standard;->mAlignment:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    return-void
.end method

.method public constructor <init>(Lcom/flyersoft/staticlayout/MyLayout$Alignment;)V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/flyersoft/staticlayout/AlignmentSpan$Standard;->mAlignment:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getAlignment()Lcom/flyersoft/staticlayout/MyLayout$Alignment;
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/flyersoft/staticlayout/AlignmentSpan$Standard;->mAlignment:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    return-object v0
.end method

.method public getSpanTypeId()I
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public getSpanTypeIdInternal()I
    .locals 1

    .line 59
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/AlignmentSpan$Standard;->getSpanTypeId()I

    move-result v0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 49
    iget-object p2, p0, Lcom/flyersoft/staticlayout/AlignmentSpan$Standard;->mAlignment:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    invoke-virtual {p2}, Lcom/flyersoft/staticlayout/MyLayout$Alignment;->name()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method

.method public writeToParcelInternal(Landroid/os/Parcel;I)V
    .locals 0

    .line 63
    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/staticlayout/AlignmentSpan$Standard;->writeToParcel(Landroid/os/Parcel;I)V

    return-void
.end method
