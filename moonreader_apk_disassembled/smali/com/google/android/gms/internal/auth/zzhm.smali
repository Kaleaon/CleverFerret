.class final Lcom/google/android/gms/internal/auth/zzhm;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-auth-base@@18.0.4"


# static fields
.field private static final zza:Lcom/google/android/gms/internal/auth/zzhk;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/auth/zzhi;->zzu()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/google/android/gms/internal/auth/zzhi;->zzv()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2
    sget v0, Lcom/google/android/gms/internal/auth/zzdr;->zza:I

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/auth/zzhl;

    invoke-direct {v0}, Lcom/google/android/gms/internal/auth/zzhl;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/auth/zzhm;->zza:Lcom/google/android/gms/internal/auth/zzhk;

    return-void
.end method

.method static bridge synthetic zza([BII)I
    .locals 6

    add-int/lit8 v0, p1, -0x1

    .line 1
    aget-byte v0, p0, v0

    sub-int/2addr p2, p1

    const/16 v1, -0xc

    const/4 v2, -0x1

    if-eqz p2, :cond_6

    const/4 v3, 0x1

    const/16 v4, -0x41

    if-eq p2, v3, :cond_3

    const/4 v5, 0x2

    if-ne p2, v5, :cond_2

    .line 2
    aget-byte p2, p0, p1

    add-int/2addr p1, v3

    aget-byte p0, p0, p1

    if-gt v0, v1, :cond_1

    if-gt p2, v4, :cond_1

    if-le p0, v4, :cond_0

    return v2

    :cond_0
    shl-int/lit8 p1, p2, 0x8

    xor-int/2addr p1, v0

    shl-int/lit8 p0, p0, 0x10

    xor-int/2addr p0, p1

    return p0

    :cond_1
    return v2

    .line 3
    :cond_2
    new-instance p0, Ljava/lang/AssertionError;

    .line 4
    invoke-direct {p0}, Ljava/lang/AssertionError;-><init>()V

    throw p0

    .line 3
    :cond_3
    aget-byte p0, p0, p1

    if-gt v0, v1, :cond_5

    if-le p0, v4, :cond_4

    return v2

    :cond_4
    shl-int/lit8 p0, p0, 0x8

    xor-int/2addr p0, v0

    return p0

    :cond_5
    return v2

    :cond_6
    if-le v0, v1, :cond_7

    return v2

    :cond_7
    return v0
.end method

.method static zzb([BII)Ljava/lang/String;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/auth/zzfa;
        }
    .end annotation

    .line 1
    array-length v0, p0

    or-int v1, p1, p2

    sub-int v2, v0, p1

    sub-int/2addr v2, p2

    or-int/2addr v1, v2

    const/4 v2, 0x0

    if-ltz v1, :cond_b

    add-int v0, p1, p2

    .line 2
    new-array v7, p2, [C

    const/4 p2, 0x0

    :goto_0
    if-ge p1, v0, :cond_1

    .line 3
    aget-byte v1, p0, p1

    invoke-static {v1}, Lcom/google/android/gms/internal/auth/zzhj;->zzd(B)Z

    move-result v3

    if-nez v3, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 p1, p1, 0x1

    add-int/lit8 v3, p2, 0x1

    int-to-char v1, v1

    .line 4
    aput-char v1, v7, p2

    move p2, v3

    goto :goto_0

    :cond_1
    :goto_1
    move v8, p2

    :cond_2
    :goto_2
    if-ge p1, v0, :cond_a

    add-int/lit8 p2, p1, 0x1

    .line 5
    aget-byte v3, p0, p1

    invoke-static {v3}, Lcom/google/android/gms/internal/auth/zzhj;->zzd(B)Z

    move-result v1

    if-eqz v1, :cond_4

    add-int/lit8 p1, v8, 0x1

    int-to-char v1, v3

    .line 9
    aput-char v1, v7, v8

    move v8, p1

    move p1, p2

    :goto_3
    if-ge p1, v0, :cond_2

    .line 10
    aget-byte p2, p0, p1

    invoke-static {p2}, Lcom/google/android/gms/internal/auth/zzhj;->zzd(B)Z

    move-result v1

    if-nez v1, :cond_3

    goto :goto_2

    :cond_3
    add-int/lit8 p1, p1, 0x1

    add-int/lit8 v1, v8, 0x1

    int-to-char p2, p2

    .line 11
    aput-char p2, v7, v8

    move v8, v1

    goto :goto_3

    :cond_4
    const/16 v1, -0x20

    if-ge v3, v1, :cond_6

    if-ge p2, v0, :cond_5

    add-int/lit8 p1, p1, 0x2

    add-int/lit8 v1, v8, 0x1

    .line 8
    aget-byte p2, p0, p2

    invoke-static {v3, p2, v7, v8}, Lcom/google/android/gms/internal/auth/zzhj;->zzc(BB[CI)V

    move v8, v1

    goto :goto_2

    .line 14
    :cond_5
    invoke-static {}, Lcom/google/android/gms/internal/auth/zzfa;->zzb()Lcom/google/android/gms/internal/auth/zzfa;

    move-result-object p0

    throw p0

    :cond_6
    const/16 v1, -0x10

    if-ge v3, v1, :cond_8

    add-int/lit8 v1, v0, -0x1

    if-ge p2, v1, :cond_7

    add-int/lit8 v1, p1, 0x2

    add-int/lit8 p1, p1, 0x3

    add-int/lit8 v4, v8, 0x1

    .line 7
    aget-byte p2, p0, p2

    aget-byte v1, p0, v1

    invoke-static {v3, p2, v1, v7, v8}, Lcom/google/android/gms/internal/auth/zzhj;->zzb(BBB[CI)V

    move v8, v4

    goto :goto_2

    .line 13
    :cond_7
    invoke-static {}, Lcom/google/android/gms/internal/auth/zzfa;->zzb()Lcom/google/android/gms/internal/auth/zzfa;

    move-result-object p0

    throw p0

    :cond_8
    add-int/lit8 v1, v0, -0x2

    if-ge p2, v1, :cond_9

    add-int/lit8 v1, p1, 0x2

    add-int/lit8 v4, p1, 0x3

    add-int/lit8 p1, p1, 0x4

    .line 6
    aget-byte p2, p0, p2

    aget-byte v5, p0, v1

    aget-byte v6, p0, v4

    move v4, p2

    invoke-static/range {v3 .. v8}, Lcom/google/android/gms/internal/auth/zzhj;->zza(BBBB[CI)V

    add-int/lit8 v8, v8, 0x2

    goto :goto_2

    .line 12
    :cond_9
    invoke-static {}, Lcom/google/android/gms/internal/auth/zzfa;->zzb()Lcom/google/android/gms/internal/auth/zzfa;

    move-result-object p0

    throw p0

    .line 6
    :cond_a
    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, v7, v2, v8}, Ljava/lang/String;-><init>([CII)V

    return-object p0

    .line 1
    :cond_b
    new-instance p0, Ljava/lang/ArrayIndexOutOfBoundsException;

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    aput-object v0, v1, v2

    const/4 v0, 0x1

    aput-object p1, v1, v0

    const/4 p1, 0x2

    aput-object p2, v1, p1

    const-string p1, "buffer length=%d, index=%d, size=%d"

    invoke-static {p1, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static zzc([B)Z
    .locals 3

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/auth/zzhm;->zza:Lcom/google/android/gms/internal/auth/zzhk;

    const/4 v1, 0x0

    array-length v2, p0

    invoke-virtual {v0, p0, v1, v2}, Lcom/google/android/gms/internal/auth/zzhk;->zzb([BII)Z

    move-result p0

    return p0
.end method

.method static zzd([BII)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/auth/zzhm;->zza:Lcom/google/android/gms/internal/auth/zzhk;

    invoke-virtual {v0, p0, p1, p2}, Lcom/google/android/gms/internal/auth/zzhk;->zzb([BII)Z

    move-result p0

    return p0
.end method
