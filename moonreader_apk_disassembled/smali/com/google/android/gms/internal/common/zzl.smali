.class final Lcom/google/android/gms/internal/common/zzl;
.super Lcom/google/android/gms/internal/common/zzk;
.source "com.google.android.gms:play-services-basement@@18.2.0"


# instance fields
.field private final zza:C


# direct methods
.method constructor <init>(C)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/common/zzk;-><init>()V

    iput-char p1, p0, Lcom/google/android/gms/internal/common/zzl;->zza:C

    return-void
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .locals 8

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CharMatcher.is(\'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-char v1, p0, Lcom/google/android/gms/internal/common/zzl;->zza:C

    const/4 v2, 0x6

    new-array v2, v2, [C

    const/16 v3, 0x5c

    const/4 v4, 0x0

    aput-char v3, v2, v4

    const/4 v3, 0x1

    const/16 v5, 0x75

    aput-char v5, v2, v3

    const/4 v3, 0x2

    aput-char v4, v2, v3

    const/4 v3, 0x3

    aput-char v4, v2, v3

    const/4 v3, 0x4

    aput-char v4, v2, v3

    const/4 v5, 0x5

    aput-char v4, v2, v5

    :goto_0
    if-ge v4, v3, :cond_0

    rsub-int/lit8 v5, v4, 0x5

    and-int/lit8 v6, v1, 0xf

    const-string v7, "0123456789ABCDEF"

    .line 2
    invoke-virtual {v7, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    aput-char v6, v2, v5

    shr-int/2addr v1, v3

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 3
    :cond_0
    invoke-static {v2}, Ljava/lang/String;->copyValueOf([C)Ljava/lang/String;

    move-result-object v1

    .line 1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\')"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final zza(C)Z
    .locals 1

    iget-char v0, p0, Lcom/google/android/gms/internal/common/zzl;->zza:C

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
